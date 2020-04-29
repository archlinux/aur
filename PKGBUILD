# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 3CE464558A84FDC69DB40CFB090B11993D9AEBB5

pkgname=guix
pkgver=1.1.0
pkgrel=1
pkgdesc="A purely functional package manager for the GNU system"
arch=('x86_64' 'i686' 'armv7h')
url="https://www.gnu.org/software/guix/"
license=('GPL3')
options=('!strip')
makedepends=(
  'bash-completion'
  'fish'
  'guile-json>=3'
  'guile-ssh>=0.10.2'
  'help2man'
  'po4a')
depends=(
  'guile>=2.2.4'
  'guile-gcrypt'
  'guile-git-lib'
  'guile-sqlite3'
  'sqlite>=3.6.19'
  'bzip2'
  'gnutls'
  'libgcrypt'
  'lzlib'
  'zlib')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'guile-json: to import packages from cpan, gem, pypi'
  'guile-ssh: to offload builds to other machines')
source=(
  "https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
install="${pkgname}.install"
sha256sums=(
  '5c59106ff4ac497c6097686834b0c914109cf5e44eb6b94ebce818923043640f'
  '0416a733ba9b4410897d744a24388a43ba11bd8c427c7d08e649c8875119333d')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')

build() {
	local bash_completion_dir="$(pkg-config --variable=completionsdir bash-completion)"
	local fish_completion_dir="$(pkg-config --variable=completionsdir fish)"
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc \
		--libexecdir=/usr/lib --localstatedir=/var \
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
	# Remove unused sysvinit service files
	rm -r "${pkgdir}/etc/init.d"
	# Remove the empty directory left by sysvinit service files as well
	rmdir "${pkgdir}/etc"
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
	eval 'options=("!strip")'
}
