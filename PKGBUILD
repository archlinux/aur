# Maintainer: René Wagner < rwagner at rw-net dot de >
# Contributor: Diab Neiroukh <lazerl0rd@thezest.dev>

pkgname=mimalloc
pkgver=2.0.3
pkgrel=1
pkgdesc='General-purpose allocator with excellent performance characteristics'
arch=('x86_64')
license=('MIT')
url='https://github.com/microsoft/mimalloc'
conflicts=('mimalloc-git')
depends=('glibc')
makedepends=('cmake')
provides=('mimalloc')
options=('staticlibs')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5af497f360879bf9d07a5146961d275a25f4177fbe21ee6c437db604422acd60')

build() {
  cp -r "${pkgname}-${pkgver}" "${pkgname}-secure_${pkgver}"

  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make

  cd "../${pkgname}-secure_${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DMI_SECURE=ON .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  cd "../${pkgname}-secure_${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -s "mimalloc-2.0/libmimalloc.so.2.0" "${pkgdir}/usr/lib/"
  ln -s "mimalloc-2.0/libmimalloc.so.2.0" "${pkgdir}/usr/lib/libmimalloc.so"
  ln -s "mimalloc-2.0/libmimalloc-secure.so.2.0" "${pkgdir}/usr/lib/"
  ln -s "mimalloc-2.0/libmimalloc-secure.so.2.0" "${pkgdir}/usr/lib/libmimalloc-secure.so"
}
