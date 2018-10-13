# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
pkgname="libcmdlinecpp"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple parser for parsing command line arguments with C++"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/libcmdlinecpp"
license=('LGPL3')
conflicts=('libcmdlinecpp-git')
provides=('libcmdlinecpp')
depends=()
makedepends=('cmake')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/nullptrT/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('94595bea9a5e1c8c99b238f8dc2ec464')

prepare() {
  cd "$srcdir"

  [[ -e build ]] && rm -r build
  [[ -e build-static ]] && rm -r build-static

  mkdir build
  mkdir build-static
}

build() {
	cd "$srcdir/build"

	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
	        -DCMAKE_BUILD_TYPE=Release \
   		-DCMDLINECPP_SHARED=ON \
		-DCMDLINECPP_INSTALL_LIBS=ON \
		"../libcmdlinecpp-$pkgver"

	make
	
	
	cd "$srcdir/build-static"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        	-DCMAKE_BUILD_TYPE=Release \
		"../libcmdlinecpp-$pkgver"
		
    make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
	
	cd "$srcdir/build-static"
	install "$srcdir/build-static/src/libcmdlinecpp.a" "$pkgdir/usr/lib/libcmdlinecpp.a"
}
