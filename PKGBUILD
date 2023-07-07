# Maintainer: gee
pkgname='rangoli'
pkgver=2.0
pkgrel=1
pkgdesc='Free, Open Source, Lightweight, Cross-platform Software for Royal Kludge Keyboards'
arch=('x86_64')
url='https://github.com/rnayabed/rangoli'
license=('GPL3')
depends=('qt6-base' 'hidapi' 'gcc-libs')
makedepends=('cmake' 'ninja')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
       "hidapi.patch"
       "rangoli.sh")
sha256sums=('83b19220d2a3ccf667f6deb8e560f816676fe426f5ecc40507c9e5f62dc9cdeb'
            '1d09c0cb39d84d6be319775791c51e84ad1999469b881627c3615e3544423f09'
            '8fead456a8b711d372e12bc058e7f6680ebc4851b854f5d908a0a24e7ed1d1c4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p1 -i ../hidapi.patch
  cmake -B build -G Ninja -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel
}

package() {
  install -Dm 755 rangoli.sh "${pkgdir}/usr/bin/rangoli"

  cd ${srcdir}/${pkgname}-${pkgver}/build/src
  install -dm 755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm 755 rangoli "${pkgdir}/usr/share/${pkgname}/"
  install -dm 755 "${pkgdir}/usr/share/${pkgname}/keyboards"
  install -Dm 755 keyboards/*.* "${pkgdir}/usr/share/${pkgname}/keyboards/"
  install -Dm 755 udev-rule-writer.sh "${pkgdir}/usr/share/${pkgname}/"
}
