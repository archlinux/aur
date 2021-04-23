# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=alembic-qfix
pkgver=1.8.0
pkgrel=2
pkgdesc="An open framework for storing and sharing scene data"
arch=('x86_64')
url="http://www.alembic.io/"
license=('BSD')
depends=('openexr' 'boost-libs' 'hdf5')
makedepends=('cmake' 'boost' 'ninja')
source=(${pkgname%-qfix}-$pkgver.tar.gz::https://github.com/alembic/alembic/archive/${pkgver}.tar.gz)
sha512sums=('23fc881863741f7fd081342f5c53c1ec3d00ab300ba8cd10e4a659ee820a9ed1244cf7cf2fd40482f6be32b9d7df44128363246e942bd03c802f3a2a81533b57')

build() {
  cd "${pkgname}-${pkgver}"

  cmake . \
    -Bbuild \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_HDF5=ON

  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR="${pkgdir}/" ninja -C build install

# quick fix for missing `imath` package ( internal of openexr )
  sed '/find_dependency(IMath)/d' -i "${pkgdir}"/usr/lib/cmake/Alembic/AlembicConfig.cmake
}

# vim:set ts=2 sw=2 et:
