# with fixes by 0xAA <0xaa@dmg.sx>
pkgname="radare2-git"
pkgver=2.4.0.r229.g405c67d77
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL3' 'LGPL3')
makedepends=('git')
depends=('capstone' 'openssl')
provides=('radare2')
conflicts=('radare2')

source=("$pkgname"::"git://github.com/radare/radare2.git")
md5sums=('SKIP')

pkgver () {
	cd ${pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
# not sure if those are still needed
	export CFLAGS="${CFLAGS//-fPIE -pie}"
	export CXXFLAGS="${CXXFLAGS//-fPIE -pie}"
	# this is actually needed to prevent linking against old system-wide r2 libs
	# you can comment this out, if you build in a clean environment
	export PKG_CONFIG_PATH="${srcdir}/${pkgname}/pkgcfg:${PKG_CONFIG_PATH}"

	cd ${srcdir}/${pkgname}
	# in theory explicitly passing --with-syscapstone shouldn't be needed
	# anymore, as ./sys/build.sh checks for a suitable system wide capstone
	# installation. Unfortunately linking syscapstone is broken and the
	# build system always clones capstone and links against this instead.
	#CFGARG="--with-syscapstone" ./sys/build.sh
	./configure --with-syscapstone --with-openssl --prefix=/usr
	make
	#./sys/build.sh
}

package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR=${pkgdir} install
	install -D -m644 man/* "${pkgdir}/usr/share/man/man1" 
	rm -rf ${srcdir}/${pkgname}
}
