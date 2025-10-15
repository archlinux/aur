# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.3.1
pkgrel=7
pkgdesc='Kolab XML Format Schema Definitions Library'
url='https://www.kolab.org/'
arch=('x86_64')
license=(LGPL-3.0-or-later)
depends=(boost-libs
         curl
         glibc
         gcc-libs
         xerces-c)
makedepends=(boost
             cmake
             git
             libxsd
             xsd)
source=(git+https://git.kolab.org/diffusion/LKX#tag=libkolabxml-$pkgver
        xsd-4.2.patch
        boost-1.89.patch)
sha512sums=('9b06dcd83f7caae6fb6fb26edc6805b08b507b28dcc0570257e7a00fffdd44310c668163bd263cad88480ea3cf83fafafdbcba094af7d448dddd95e90c61e9e8'
            'a7febec03ccaa99f22e10fad604c66c12d35dd91f2a01287f4c96a2037237d86ee4f918aaa5b2857fce6fdf5482f7ad6bf36bec9c96473c4a711c7605448d868'
            'e18d3bb1a7326f83e077f8a31e542b634de0c5cff4ea9ee196956037c4517915fb7e0126ca339b78027773bc9ca7c4de50da911f96f24453a887173f7a284d96')

prepare() {
  patch -d LKX -p1 < xsd-4.2.patch # Fix build with XSD 4.2
  patch -d LKX -p1 < boost-1.89.patch # Fix build with boost 1.89
}

build() {
  cmake -B build -S LKX \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
