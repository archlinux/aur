# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=apparmor-git
pkgver=2.13.r234.g395aed72
pkgrel=1
pkgdesc='Mandatory Access Control (MAC) using Linux Security Module (LSM)'
arch=('x86_64')
url='https://gitlab.com/apparmor/apparmor'
license=('GPL')
depends=('audit' 'pam' 'python')
makedepends=('git' 'swig' 'chrpath' 'ruby')
optdepends=('perl: perl bindings'
            'ruby: ruby bindings')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}" 'libapparmor')
replaces=('apparmor-libapparmor' 'apparmor-pam' 'apparmor-parser' 'apparmor-profiles' 'apparmor-utils' 'apparmor-vim')
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/subdomain.conf'
        'etc/apparmor/severity.db')
source=("${pkgname%-git}::git+https://gitlab.com/apparmor/apparmor.git")
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
	# fix bin directory for parser install target
	# fix lib dir location
	# fix missing executable bit on apparmor.systemd script
	sed -e 's/sbin/usr\/bin/g' \
		-e 's/\}\/lib\/apparmor/\}\/usr\/lib\/apparmor/' \
		-e 's/644 apparmor.systemd/755 apparmor.systemd/' \
		-i parser/Makefile
	# fix default vim syntax file installation path
	sed -e 's/share\/apparmor/share\/vim\/vimfiles\/syntax/' -i utils/vim/Makefile
	cd "${srcdir}/${pkgname%-git}/libraries/libapparmor"
	autoreconf -vfi
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
		--with-pic=yes \
		--with-perl \
		--with-python \
		--with-ruby
	make
	cd "${srcdir}/${pkgname%-git}"
	make -C parser
	make -C profiles
	make -C utils
	make -C changehat/pam_apparmor
	make -C utils/vim
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make -C libraries/libapparmor DESTDIR="${pkgdir}" install
	make -C changehat/pam_apparmor DESTDIR="${pkgdir}/usr" install
	make -C parser DESTDIR="${pkgdir}" USR_SBINDIR="${pkgdir}/usr/bin" install
	make -C parser DESTDIR="${pkgdir}" USR_SBINDIR="${pkgdir}/usr/bin" install-systemd
	make -C profiles DESTDIR="${pkgdir}" install
	make -C utils DESTDIR="${pkgdir}" BINDIR="${pkgdir}/usr/bin" install
	# strip perl library and remove empty rpath
	find "${pkgdir}/usr/lib/perl5/" -type f -iname '*.so' \
		-exec strip --strip-unneeded {} \; \
		-exec chrpath -d {} \;
	# move ruby bindings to vendor_ruby
	mv -v "${pkgdir}/usr/lib/ruby/site_ruby/" "${pkgdir}/usr/lib/ruby/vendor_ruby/"
	# adding files below /etc/apparmor.d to backup array
	cd "${pkgdir}"
	# tricking extract_function_variable() in makepkg into not detecting the
	# backup array modification
	[[ /usr/bin/true ]] && backup=( ${backup[@]} $(find 'etc/apparmor.d/' -type f) )
}
