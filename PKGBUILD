# Maintainer: gee
pkgname='rangoli'
pkgver=2.0
pkgrel=3
pkgdesc='Free, Open Source, Lightweight, Cross-platform Software for Royal Kludge Keyboards'
arch=('x86_64')
url='https://github.com/rnayabed/rangoli'
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'hidapi' 'gcc-libs' 'xterm')
makedepends=('cmake' 'ninja')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
       "hidapi.patch"
       "rangoli.sh"
       "qapp.patch")
sha256sums=('83b19220d2a3ccf667f6deb8e560f816676fe426f5ecc40507c9e5f62dc9cdeb'
            '1d09c0cb39d84d6be319775791c51e84ad1999469b881627c3615e3544423f09'
            '8fead456a8b711d372e12bc058e7f6680ebc4851b854f5d908a0a24e7ed1d1c4'
            '3b42249b8d80471c6278c9d85813d06f2dc34afe6c3bd89c15f53416ca8e5a5f')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}
	patch -p1 -i ../hidapi.patch
	patch -p1 -i ../qapp.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -B build -G Ninja -S . -DCMAKE_BUILD_TYPE=Release
  cmake --build build --parallel
}

package() {
  install -Dm 755 rangoli.sh "${pkgdir}/usr/bin/${pkgname}"

  cd ${srcdir}/${pkgname}-${pkgver}/
  cmake --install build --prefix "${pkgdir}"
  install -dm 755 "${pkgdir}/usr/share"
  mv "${pkgdir}/bin" "${pkgdir}/usr/share/${pkgname}"
  chmod +x "${pkgdir}/usr/share/rangoli/udev-rule-writer.sh"
}
