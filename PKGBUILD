# with fixes by 0xAA <0xaa@dmg.sx>
pkgname="radare2-git"
pkgver=20150715.8475.d4eb221
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL3' 'LGPL3')
makedepends=('git')
depends=('capstone')
provides=('radare2') # capstone-git is reccomended
conflicts=('radare2')

source=("$pkgname"::"git://github.com/radare/radare2.git")
md5sums=('SKIP')

pkgver () {
	_date=`date +"%Y%m%d"`
	cd "${srcdir}/${pkgname}"
	echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
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
	#./autogen.sh # needs acr
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
