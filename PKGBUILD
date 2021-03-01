# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 3CE464558A84FDC69DB40CFB090B11993D9AEBB5

pkgname=guix
pkgver=1.2.0
pkgrel=1
pkgdesc='A purely functional package manager for the GNU system'
arch=('x86_64' 'i686' 'armv7h')
url='https://guix.gnu.org'
license=('GPL3')
options=('!strip')
makedepends=(
  'guile-ssh>=0.13.0'
  'guile-zstd'
  'guile-semver'
  'bash-completion'
  'fish'
  'help2man'
  'po4a')
depends=(
  'guile>=2.2.4'
  'guile-gcrypt>=0.1.0'
  'guile-sqlite3>=0.1.0'
  'guile-zlib'
  'guile-lzlib'
  'guile-avahi'
  'guile-git-lib>=0.3.0'
  'guile-json>=4.3.0'
  'sqlite>=3.6.19'
  'bzip2'
  'gnutls'
  'libgcrypt')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'guile-ssh: to offload builds to other machines'
  'guile-zstd: to use and publish zstd substitutes'
  'guile-semver: to use the crate importer')
source=(
  "https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
  'guix-1.2.0-json-cve-swh.patch'
  'guix-1.2.0-json-crate.patch'
  'guix-1.2.0-guile-json-4.5.patch'
  'guix-1.2.0-revert-verify-swh-certificate.patch')
install="${pkgname}.install"
sha256sums=(
  '5ecdf7ced25b1fb0ca7c57e794b7b60c8a7adcb15261dec2af37925c838c6d74'
  'e278e3aba3fe9acd35aa6586933d940f0c847ccfb6d1370cb5c4f754732d2fb6'
  '39fba6b74fcc97155f0e81c603d3e0a0dcc17ce8070faa47dec5bd637383aedd'
  '1b62d816090305ce5e5742813341409aa7b68157cc1c3cfc0b0fff3a583d2762'
  '837def9c966f14e29291dfac6c8c642d8b64eda46458605bef6416a155d5ba4e'
  '921c6fd2849c38d93e1f23e5d1f582889e2fc705c1827702bddecede3344088b')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
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
