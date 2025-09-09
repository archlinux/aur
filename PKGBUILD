# Maintainer: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Chris Simpson <csimpson.aur at gmail dot com>
# Contributor: Carlos Sánchez <cargabsj175 at gmail dot com>

pkgname=jzintv
pkgver=20200712
pkgrel=1
pkgdesc="Intellivision Emulator"
arch=('x86_64')
url="http://spatula-city.org/~im14u2c/intv/"
license=('GPL')
depends=('gcc-libs' 'sdl')
provides=('jzintv')
source=(http://spatula-city.org/~im14u2c/intv/dl/jzintv-${pkgver}-src.zip
        jzintv-20200712-termios.patch)
sha512sums=('c7f30018fc5324c48b156b654b9e56b12614f8eb7c67c5a52146241ff985d972fb9d330aafde701e572d355c945e2b9c07145058e7d9e500bf2380b8a78a4ba7'
            '5de6a59e280239983d72989ab16c384d9d8b534d3cf48b795635e7bd3fea9bb0a28366d5542e75b69276b4fd2d2e6efb58d736a82fd1b3d1990659f38f20e909')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/src"
  patch -Np2 -i "${srcdir}/jzintv-${pkgver}-termios.patch"
  find . -type f -name "Makefile*" -exec sed -i 's/-ltermcap/-lncurses/g' {} +
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/src"
  make -f Makefile ../bin/jzintv
}

package() {
  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/${pkgname}/{examples,rom} ${pkgdir}/usr/share/doc/${pkgname}
  install -D ${srcdir}/${pkgname}-${pkgver}-src/bin/jzintv -t ${pkgdir}/usr/bin/
  install -D ${srcdir}/${pkgname}-${pkgver}-src/examples/*.txt -t ${pkgdir}/usr/share/jzintv/examples/
  install -D ${srcdir}/${pkgname}-${pkgver}-src/rom/* -t ${pkgdir}/usr/share/jzintv/rom/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}-src/COPYING.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  cp -Ra ${srcdir}/${pkgname}-${pkgver}-src/doc/* ${pkgdir}/usr/share/doc/${pkgname}/
}
