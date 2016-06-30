# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=vzlogger-git
pkgver=r602.b5c381f
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
source=('git://github.com/volkszaehler/vzlogger.git'
        'https://patch-diff.githubusercontent.com/raw/volkszaehler/vzlogger/pull/267.patch'
        'https://patch-diff.githubusercontent.com/raw/volkszaehler/vzlogger/pull/269.patch')
sha1sums=('SKIP'
          '2d44f55067b25b0c50b96b2dae73b71610b94ef7'
          'cd57018434a305d512cb6ce775ae0cb09c1c9081')

_gitname=vzlogger

pkgver() {
	cd $srcdir/$_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$_gitname
	patch -p1 < ../267.patch
	patch -p1 < ../269.patch
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
