# Contributor: aimileus <me at aimileus dot nl>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite
pkgver=10.2.1
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=(any)
license=(GPL3)
url="http://www.phoronix-test-suite.com/"
depends=(php)
optdepends=('php-gd'
            'sqlite3: required when running a Phoromatic server.'
            'gcc-fortran: required for universe-cli test suite'
            'blas: required for universe-cli test suite'
            'lapack: required for universe-cli test suite'
            'portaudio: required for universe-cli test suite'
            'unzip: required for universe-cli test suite'
            'mesa-demos: required for universe-cli test suite'
            'openmpi: required for universe-cli test suite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/phoronix-test-suite/phoronix-test-suite/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/phoronix-test-suite-launcher.patch")
sha256sums=('4f6a5dd423b3d894c42d60e5c363938074b6fbe679044dd54a8c87333baf49d1'
            '577326343d0303a59fd469c3f9c9740e756dd59c0660c54363b62d6fd1cee26d')
options=(!strip)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch phoronix-test-suite -i "${srcdir}/phoronix-test-suite-launcher.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install-sh $pkgdir/usr

  rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy
  rm -rf "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/{dependency-handlers,scripts,xml}/{*.php,*.sh,*.xml}

  install -D "${srcdir}/phoronix-test-suite-${pkgver}"/pts-core/external-test-dependencies/dependency-handlers/arch_dependency_handler.php \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/dependency-handlers/arch_dependency_handler.php

  install -D "${srcdir}/phoronix-test-suite-${pkgver}"/pts-core/external-test-dependencies/scripts/install-arch-packages.sh \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/scripts/install-arch-packages.sh

  install -D "${srcdir}/phoronix-test-suite-${pkgver}"/pts-core/external-test-dependencies/xml/arch-packages.xml \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/xml/arch-packages.xml

  install -D "${srcdir}/phoronix-test-suite-${pkgver}"/pts-core/external-test-dependencies/xml/generic-packages.xml \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/xml/generic-packages.xml

  ln -s /usr/bin/phoronix-test-suite "$pkgdir/usr/bin/pts"
}
