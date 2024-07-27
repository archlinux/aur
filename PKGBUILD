# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=apparmor-git
pkgver=4.0.0.beta3.r194.geac9f23
pkgrel=1
pkgdesc='Mandatory Access Control (MAC) using Linux Security Module (LSM)'
arch=('x86_64')
url='https://gitlab.com/apparmor/apparmor'
license=('GPL-2.0-only' 'LGPL-2.0-only' 'LGPL-2.1-only')
depends=('audit' 'bash' 'gcc-libs' 'glibc' 'pam' 'python')
makedepends=('git' 'apache' 'autoconf-archive' 'libxcrypt' 'python-setuptools' 'ruby' 'swig')
checkdepends=('dejagnu' 'perl-locale-gettext' 'python-notify2' 'python-psutil')
optdepends=('perl: for perl bindings'
            'python-notify2: for aa-notify'
            'python-psutil: for aa-notify'
            'ruby: for ruby bindings')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}" 'libapparmor.so')
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/severity.db')
source=('git+https://gitlab.com/apparmor/apparmor.git')
sha512sums=('SKIP')
# AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB')

_core_perl='/usr/bin/core_perl'

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}/libraries/libapparmor/"
	autoreconf -fiv
}

build() {
	local configure_options=(
		--prefix=/usr
		--sbindir=/usr/bin
		--with-perl
		--with-python
		--with-ruby
	)

	cd "${srcdir}/${pkgname%-git}"

	# export required perl executable locations
	export MAKEFLAGS+=" POD2MAN=${_core_perl}/pod2man"
	export MAKEFLAGS+=" POD2HTML=${_core_perl}/pod2html"
	export MAKEFLAGS+=" PODCHECKER=${_core_perl}/podchecker"
	export MAKEFLAGS+=" PROVE=${_core_perl}/prove"
	(
		cd libraries/libapparmor/
		./configure "${configure_options[@]}"
		make
	)
	make -C binutils
	make -C parser
	make -C profiles
	make -C utils
	make -C changehat/pam_apparmor
	make -C changehat/mod_apparmor
	make -C utils/vim

	# copy to test location as some tests render the resulting python bytecode
	# unreproducible: https://gitlab.com/apparmor/apparmor/-/issues/184
	cd ..
	cp -av "${srcdir}/${pkgname%-git}" "${srcdir}/${pkgname%-git}-test"
}

check() {
	cd "${srcdir}/${pkgname%-git}-test"
	echo "INFO: Running check: libraries/libapparmor"
	make -C libraries/libapparmor check
	echo "INFO: Running check binutils"
	make -C binutils check
	# echo "INFO: Running check parser"
	# make -C parser check
	# NOTE: the profiles checks are notoriously broken, so run each separately
	echo "INFO: Running check-abstractions.d profiles"
	make -C profiles check-abstractions.d
	# many hardcoded paths are not accounted for:
	# https://gitlab.com/apparmor/apparmor/-/issues/137
	# echo "INFO: Running check-logprof profiles"
	# make -C profiles check-logprof
	echo "INFO: Running check-parser profiles"
	make -C profiles check-parser
	echo "INFO: Running check utils"
	# we do not care about linting when running tests
	# https://gitlab.com/apparmor/apparmor/-/issues/121
	make PYFLAKES='/usr/bin/true' -C utils check
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make -C libraries/libapparmor DESTDIR="${pkgdir}" install
	make -C changehat/pam_apparmor DESTDIR="${pkgdir}/usr" install
	make -C changehat/mod_apparmor DESTDIR="${pkgdir}" install
	make -C binutils DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" install
	make -C parser -j1 DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" install install-systemd
	make -C profiles DESTDIR="${pkgdir}" install
	make -C utils DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" BINDIR="${pkgdir}/usr/bin" VIM_INSTALL_PATH="${pkgdir}/usr/share/vim/vimfiles/syntax" install

	# set file mode to allow the perl library to be stripped:
	# https://gitlab.com/apparmor/apparmor/issues/34
	find "${pkgdir}/usr/lib/perl5/" -type f -iname '*.so' -exec chmod 755 {} ';'

	# remove empty core_perl directory:
	# https://gitlab.com/apparmor/apparmor/issues/40
	rm -rv "${pkgdir}"/usr/lib/perl5/*/core_perl
	# move ruby bindings to vendor_ruby:
	# https://gitlab.com/apparmor/apparmor/issues/35
	mv -v "${pkgdir}/usr/lib/ruby/"{site,vendor}_ruby
	# adding files below /etc/apparmor.d to backup array
	cd "${pkgdir}"
	# trick extract_function_variable() in makepkg into not detecting the
	# backup array modification and adding remaining configuration files
	[[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname%-git}.d/" -type f | LC_ALL=C sort) )
}
