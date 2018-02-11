# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey
pkgver=3.2
pkgrel=4
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(hidapi)
makedepends=('cmake' 'qt5-tools')
source=("https://github.com/Nitrokey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b4ebffcf2143fb2cf535200a1f77ac123d50d87747e40ff8587f3fad2f2cb0fa')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
  mkdir -p build

  # This modify the template file, which will serve to generate the
  # /usr/lib/pkgconfig/libnitrokey-1.pc final file. Without this line,
  # the pkgconfig file will keep a reference to /usr/lib64
  sed -i 's|^libdir=@CMAKE_INSTALL_FULL_LIBDIR@$|libdir=/usr/lib|' \
      libnitrokey.pc.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  cmake .. \
        -DBUILD_SHARED_LIBS=ON \
        -DCOMPILE_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install

  cd ..
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/"
  mv lib64 lib
}
