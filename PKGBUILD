# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=vzlogger-git
pkgver=r606.8324cdd
pkgrel=1
pkgdesc="Tool to read and log measurements of many smart meters and sensors"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('libsml' 'libmbus' 'json-c' 'libmicrohttpd' 'curl')
optdepends=()
provides=('vzlogger')
conflicts=('vzlogger')
url="http://wiki.volkszaehler.org/software/controller/vzlogger"
backup=('etc/vzlogger.conf')
source=('git://github.com/volkszaehler/vzlogger.git')
sha1sums=('SKIP')

_gitname=vzlogger

pkgver() {
	cd $srcdir/$_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_gitname
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j1 # https://github.com/volkszaehler/vzlogger/issues/268
}

check() {
	cd $srcdir/$_gitname/build
	ln -fs ../etc
	make test
}

package() {
	cd $srcdir/$_gitname/build
	make DESTDIR=$pkgdir install
	mkdir -p $pkgdir/etc
	install -m644 ../etc/vzlogger.conf $pkgdir/etc/vzlogger.conf
}
