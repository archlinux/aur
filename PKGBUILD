# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 3CE464558A84FDC69DB40CFB090B11993D9AEBB5

pkgname=guix
pkgver=1.0.0
pkgrel=1
pkgdesc="A purely functional package manager for the GNU system"
arch=('x86_64' 'i686' 'armv7h')
url="https://www.gnu.org/software/guix/"
license=('GPL3')
options=('!strip')
makedepends=(
  'bash-completion'
  'fish'
  'guile-json1'
  'guile-ssh>=0.10.2'
  'help2man')
depends=(
  'guile>=2.2.4'
  'guile-gcrypt'
  'guile-git-lib'
  'guile-sqlite3'
  'sqlite>=3.6.19'
  'bzip2'
  'gnutls-guile'
  'libgcrypt'
  'zlib')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'guile-json1: to import packages from cpan, gem, pypi'
  'guile-ssh: to offload builds to other machines')
source=(
  "https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
  "${pkgname}-${pkgver}-docker-image.tmpl::https://git.savannah.gnu.org/cgit/guix.git/plain/gnu/system/examples/docker-image.tmpl?h=v${pkgver}"
  'guix-1.0.0-tests-gremlin.patch'
  'guix-1.0.0-tests-guix-pack-localstatedir.patch')
install="${pkgname}.install"
sha1sums=(
  'fd64cd4347214a4e75d611696c9929cba8995323'
  '42fef4a882b71b0413d33a6f9199a53cc92bba74'
  'SKIP'
  'SKIP'
  'SKIP')
sha256sums=(
  'SKIP'
  'SKIP'
  'f0567476a202c1c3bc3eacf991f3b5f5af030ed165a1846d045a9a375f4851ba'
  '6dd16cbf6b8d03e866e8dcc29a9b3ae689438de7041e05cb303a7585634ae80a'
  '2038b2e2282ce29b837701688d86339ccdf1df6f7d842c45f663046489d47415')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Obtain the file from the git repository and put it into the source tree.
	# It is required by the test tests/guix-system.sh.
	# https://debbugs.gnu.org/35774
	cp "${srcdir}/${source[2]%%::*}" gnu/system/examples/docker-image.tmpl
	# Apply patches to avoid unexpected test failure.
	# https://debbugs.gnu.org/35775
	# https://debbugs.gnu.org/35776
	local source_file
	for source_file in "${source[@]}"; do
		case "${source_file}" in
			*.patch)
				patch -p1 < "${srcdir}/${source_file}"
				;;
		esac
	done
}

build() {
	local bash_completion_dir="$(pkg-config --variable=completionsdir bash-completion)"
	local fish_completion_dir="$(pkg-config --variable=completionsdir fish)"
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc \
		--libexecdir="/usr/lib/${pkgname}" --localstatedir=/var \
		--with-bash-completion-dir="${bash_completion_dir}" \
		--with-fish-completion-dir="${fish_completion_dir}" \
		--disable-rpath \
		ac_cv_guix_test_root="$(pwd)/t"
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Check whether the current working directory is too long
	local cwd_str="$(pwd)"
	local cwd_len="${#cwd_str}"
	# The test tests/gexp.scm fails when the path is longer than 29 bytes
	# because of the length limit on the shebang line. Since we have increased
	# the limit by 7 by renaming test-tmp to t with ac_cv_guix_test_root cache
	# variable, the limit we use here is 36 bytes.
	if [ "${cwd_len}" -gt 36 ]; then
		error "${cwd_str} is too long."
		error "The working directory cannot be longer than 36 bytes."
		false
	fi
	# Make sure we have a valid shell accepting -c option
	SHELL=/bin/sh make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	# Remove unused upstart service files
	rm -r "${pkgdir}/usr/lib/upstart"
	# Rename systemd service files provided by upstream because they are not
	# usable without previous guix installation
	local system_unit_dir="${pkgdir}/usr/lib/systemd/system"
	local guix_daemon_default="${system_unit_dir}/guix-daemon.service"
	local guix_daemon_upstream="${system_unit_dir}/guix-daemon-latest.service"
	local guix_publish_default="${system_unit_dir}/guix-publish.service"
	local guix_publish_upstream="${system_unit_dir}/guix-publish-latest.service"
	mv "${guix_daemon_default}" "${guix_daemon_upstream}"
	mv "${guix_publish_default}" "${guix_publish_upstream}"
	# Generate default systemd service files from upstream ones by fixing paths
	local guix_profile_root="/var/guix/profiles/per-user/root/current-guix"
	sed -e "s|^ExecStart=${guix_profile_root}/bin|ExecStart=/usr/bin|" \
		-e "s|^Description=\(.*\)|Description=\1 (default)|" \
		-e "/^Environment=/d" "${guix_daemon_upstream}" \
		> "${guix_daemon_default}"
	sed -e "s|^ExecStart=${guix_profile_root}/bin|ExecStart=/usr/bin|" \
		-e "s|^Description=\(.*\)|Description=\1 (default)|" \
		-e "/^Environment=/d" "${guix_publish_upstream}" \
		> "${guix_publish_default}"
	# Make sure the above sed commands really work
	! cmp "${guix_daemon_default}" "${guix_daemon_upstream}"
	! cmp "${guix_publish_default}" "${guix_publish_upstream}"
	# Edit the description of upstream systemd service files
	sed -i "s|^Description=\(.*\)|Description=\1 (upstream)|" \
		"${guix_daemon_upstream}" "${guix_publish_upstream}"
	# The default makepkg strip option cannot be used here because binaries
	# installed in /usr/share must not be stripped.
	# To keep user-defined 'strip' and 'debug' options useful, we still
	# depend on 'tidy_strip' function provided by makepkg to do the stripping
	# work. To make the function useful, we have to temporarily remove the
	# '!strip' option from 'options' array. However, assignments to 'options'
	# cause mksrcinfo to insert wrong lines to .SRCINFO, so they have to be
	# put in eval.
	eval 'options=()'
	cd "${pkgdir}/usr/bin"
	tidy_strip
	cd "${pkgdir}/usr/lib/guix"
	tidy_strip
	eval 'options=("!strip")'
	# Make sure bootstrap binaries are not modified
	cd "${pkgdir}/usr/share/guile/site/2.2/gnu/packages/bootstrap"
	cat << EOF | sha256sum -c
e3bf6ffe357eebcc28221ffdbb5b00b4ed1237cb101aba4b1b8119b08c732387  aarch64-linux/bash
444c2af9fefd11d4fc20ee9281fa2c46cbe3cfb3df89cc30bcd50d20cdb6d6c0  aarch64-linux/mkdir
05273f978a072269193e3a09371c23d6d149f6d807f8e413a4f79aa5a1bb6f25  aarch64-linux/tar
48e9baa8a6c2527a5b4ecb8f0ac87767e2b055979256acab2a3dbff4f6171637  aarch64-linux/xz
2ad82bb9ee6e77eaff284222e1d43a2829b5a1e2bcf158b08564a26da48e0045  armhf-linux/bash
a19e386b31ebc8a46b5f934c11bca86e28f8aa997272a5fcd052b52d5019f790  armhf-linux/mkdir
da56be0b332fac3880b151abe60c1eeb2649cd192379b18658b1d872f7aa53e8  armhf-linux/tar
6507d04d55210e3a8cdc2e5758d79a4b0da3cb53bb142f60a78788af7b915ab1  armhf-linux/xz
ed059a9ae964d538605c923c4e73128bd5ca912994709b3fe2d71d061751e8c5  i686-linux/bash
b369264bda7bbb98d1acf0bf53ebc9077e82f48b190f3956fa23cb73d6e99f92  i686-linux/mkdir
9f7e79e52aa369fc9ed69359e503d4f8179117842df8261fc0cae5629cc896cb  i686-linux/tar
d23173dfe66c41e1c8d8eef905d14d1f39aaa52c9d70621f366c275e9139b415  i686-linux/xz
213cfb8794ffdf4a71cb321a89987ee61704edcec5d1203912575f0a626a239c  mips64el-linux/bash
d436070fde044366d72d7e59d8d12b1ba72b32d7b0f13e409b61118bdc8254c8  mips64el-linux/mkdir
d27fcb52f9b4a42fafdae3164fffd200f52e04d142574dcf06212dbf7701cbb8  mips64el-linux/tar
107eac7523b0148d18f461d81bec9d0db6154d6c61e4caf3a4cdb43a9a6afb3c  mips64el-linux/xz
265d2f633a5ab35747fc4836b5e3ca32bf56ad44cc24f3bd358f1ff6cf0779a5  x86_64-linux/bash
50689abdf2d5374e17ea8c51801f04f7590ad604af33a12a940cc11d137a4a2f  x86_64-linux/mkdir
16440b4495a2ff9c6aa50c05a8c9066e1004a5990b75aa891f08cdf8753c8689  x86_64-linux/tar
930ad7e88ca0b2275dc459b24aea912fadd5b7c9e95be06788d4b61efc7ef470  x86_64-linux/xz
EOF
}
