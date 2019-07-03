# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=hypercube
pkgver=1.7.0
pkgrel=2
pkgdesc='Graph visualization tool'
arch=(x86_64)
url='http://tumic.wz.cz/hypercube/'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/tumic0/${pkgname}/archive/${pkgver}.tar.gz"
        'hypercube.desktop')
sha256sums=('e35e849feb2a58395f106ebd6d745bd2315bf215f089c12149372015b19e55dc'
            '2e40776d1f27d58ccdf1206de469f1b0b6c950793874af603aa97b71fe0434d8')

build() {
  cd ${pkgname}-${pkgver}

  rm -rf build
  mkdir -p build
  cd build

  lrelease ../hypercube.pro
  qmake ../hypercube.pro
  make

  cd ..
  rm -rf build-cli
  mkdir -p build-cli
  cd build-cli

  qmake ../hypercube-cli.pro
  make
}

package() {
  cd ${pkgname}-${pkgver}

  gzip hypercube.1

  install -dm755 ${pkgdir}/usr/share/${pkgname}/{examples,translations}
  install -Dm755 build/hypercube ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 build-cli/hypercube-cli ${pkgdir}/usr/bin/${pkgname}-cli
  install -Dm644 hypercube.1.gz ${pkgdir}/usr/share/man/man1/hypercube.1.gz
  ln -s /usr/share/man/man1/hypercube.1.gz $pkgdir/usr/share/man/man1/hypercube-cli.1.gz
  install -Dm644 examples/* ${pkgdir}/usr/share/${pkgname}/examples
  install -Dm644 lang/*.qm ${pkgdir}/usr/share/${pkgname}/translations
  install -Dm644 icons/hypercube.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm644 ../hypercube.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
