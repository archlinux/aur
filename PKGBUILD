# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=apparmor-git
pkgver=3.0.0.r519.g2a3140cb
pkgrel=1
pkgdesc='Mandatory Access Control (MAC) using Linux Security Module (LSM)'
arch=('x86_64')
url='https://gitlab.com/apparmor/apparmor'
license=('GPL2' 'LGPL2.1')
depends=('audit' 'bash' 'glibc' 'pam' 'python')
makedepends=('git' 'apache' 'libxcrypt' 'python-setuptools' 'perl' 'ruby' 'swig')
checkdepends=('dejagnu' 'perl-locale-gettext' 'python-pyflakes' 'python-notify2' 'python-psutil')
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
# LTO is currently still broken: https://gitlab.com/apparmor/apparmor/-/issues/214
options=(!lto)
source=('git+https://gitlab.com/apparmor/apparmor.git')
sha512sums=('SKIP')
# AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB')

_core_perl='/usr/bin/core_perl'

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"

	# fix PYTHONPATH and add LD_LIBRARY_PATH for aa-logprof based check:
	# https://gitlab.com/apparmor/apparmor/issues/39
	local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	local path="${PWD}/libraries/libapparmor/swig/python/build/lib.linux-${CARCH}-${python_version}/"
	local libs="${PWD}/libraries/libapparmor/src/.libs"

	sed -e "/PYTHONPATH/ s|utils\ |utils:$path\ LD_LIBRARY_PATH=$libs\ |" -i profiles/Makefile

	(
		cd libraries/libapparmor/
		autoreconf -fiv
	)
}

build() {
	# export required perl executable locations
	export MAKEFLAGS+=" POD2MAN=${_core_perl}/pod2man"
	export MAKEFLAGS+=" POD2HTML=${_core_perl}/pod2html"
	export MAKEFLAGS+=" PODCHECKER=${_core_perl}/podchecker"
	export MAKEFLAGS+=" PROVE=${_core_perl}/prove"

	(
		cd "${srcdir}/${pkgname%-git}/libraries/libapparmor"
		./configure \
			--prefix=/usr \
			--sbindir=/usr/bin \
			--sysconfdir=/etc \
			--with-pic \
			--with-perl \
			--with-python \
			--with-ruby
		make
	)
	cd "${srcdir}/${pkgname%-git}"
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
	make -C changehat/pam_apparmor DESTDIR="${pkgdir}" SECDIR="${pkgdir}/usr/lib/security" install
	make -C changehat/mod_apparmor DESTDIR="${pkgdir}" install
	make -C binutils DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" install
	make -C parser -j1 DESTDIR="${pkgdir}" APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" install install-systemd
	make -C profiles DESTDIR="${pkgdir}" install
	make -C utils DESTDIR="${pkgdir}" BINDIR="${pkgdir}/usr/bin" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" VIM_INSTALL_PATH="${pkgdir}/usr/share/vim/vimfiles/syntax" install

	# set file mode to allow the perl library to be stripped:
	# https://gitlab.com/apparmor/apparmor/issues/34
	find "${pkgdir}/usr/lib/perl5/" -type f -iname "*.so" -exec chmod 755 {} \;

	# removing empty core_perl directory:
	# https://gitlab.com/apparmor/apparmor/issues/40
	rm -rv "${pkgdir}/usr/lib/perl5/"*/core_perl
	# move ruby bindings to vendor_ruby:
	# https://gitlab.com/apparmor/apparmor/issues/35
	mv -v "${pkgdir}/usr/lib/ruby/site_ruby/" "${pkgdir}/usr/lib/ruby/vendor_ruby/"
	# adding files below /etc/apparmor.d to backup array
	cd "${pkgdir}"
	# trick extract_function_variable() in makepkg into not detecting the
	# backup array modification and adding remaining configuration files
	true && backup+=( $(find 'etc/apparmor.d/' -type f) )
}
