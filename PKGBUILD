# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=apparmor-git
pkgver=2.13.r676.g1567ea6f
pkgrel=1
pkgdesc='Mandatory Access Control (MAC) using Linux Security Module (LSM)'
arch=('x86_64')
url='https://gitlab.com/apparmor/apparmor'
license=('GPL')
depends=('audit' 'bash' 'pam' 'python')
makedepends=('git' 'apache' 'swig' 'perl' 'ruby')
checkdepends=('dejagnu' 'perl-locale-gettext' 'python-pyflakes' 'python-notify2' 'python-psutil')
optdepends=('perl: perl bindings'
            'ruby: ruby bindings'
            'python-notify2: for the aa-notify tool'
            'python-psutil: for the aa-notify tool')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}" 'libapparmor.so')
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/subdomain.conf'
        'etc/apparmor/severity.db')
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
	local _py3_ver=$(python --version | cut -d " " -f2)
	local path="${PWD}/libraries/libapparmor/swig/python/build/lib.linux-${CARCH}-${_py3_ver%"."*}/LibAppArmor"
	local libs="${PWD}/libraries/libapparmor/src/.libs"
	sed -e "/PYTHONPATH/ s|utils\ |utils:$path\ LD_LIBRARY_PATH=$libs\ |" -i profiles/Makefile

	cd "${srcdir}/${pkgname%-git}/libraries/libapparmor"
	./autogen.sh
}

build() {
	# export required perl executable locations
	export MAKEFLAGS+=" POD2MAN=${_core_perl}/pod2man"
	export MAKEFLAGS+=" POD2HTML=${_core_perl}/pod2html"
	export MAKEFLAGS+=" PODCHECKER=${_core_perl}/podchecker"
	export MAKEFLAGS+=" PROVE=${_core_perl}/prove"
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
	cd "${srcdir}/${pkgname%-git}"
	make -C binutils
	make -C parser
	make -C profiles
	make -C utils
	make -C changehat/pam_apparmor
	make -C changehat/mod_apparmor
	make -C utils/vim
}

check() {
	cd "${srcdir}/${pkgname%-git}"
	make -C libraries/libapparmor check
	make -C binutils check
	make -C parser check
	# only running check-parser, as check-logprof (included in check) fails:
	# https://gitlab.com/apparmor/apparmor/issues/36
	make -C profiles check-parser
	make -C utils check
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make -C libraries/libapparmor DESTDIR="${pkgdir}" install
	make -C changehat/pam_apparmor DESTDIR="${pkgdir}" SECDIR="${pkgdir}/usr/lib/security" install
	make -C changehat/mod_apparmor DESTDIR="${pkgdir}" install
	make -C binutils DESTDIR="${pkgdir}" install
	make -C parser DESTDIR="${pkgdir}" APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" install
	make -C parser DESTDIR="${pkgdir}" APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" SBINDIR="${pkgdir}/usr/bin" USR_SBINDIR="${pkgdir}/usr/bin" install-systemd
	make -C profiles DESTDIR="${pkgdir}" install
	make -C utils DESTDIR="${pkgdir}" BINDIR="${pkgdir}/usr/bin" VIM_INSTALL_PATH="${pkgdir}/usr/share/vim/vimfiles/syntax" install
	# removing empty core_perl directory:
	# https://gitlab.com/apparmor/apparmor/issues/40
	rm -rv "${pkgdir}/usr/lib/perl5/"*/core_perl
	# move ruby bindings to vendor_ruby:
	# https://gitlab.com/apparmor/apparmor/issues/35
	mv -v "${pkgdir}/usr/lib/ruby/site_ruby/" "${pkgdir}/usr/lib/ruby/vendor_ruby/"
	# adding files below /etc/apparmor.d to backup array
	cd "${pkgdir}"
	# tricking extract_function_variable() in makepkg into not detecting the
	# backup array modification and adding remaining configuration files
	[[ /usr/bin/true ]] && backup=( ${backup[@]} $(find 'etc/apparmor.d/' -type f) )
}
