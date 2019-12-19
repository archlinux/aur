# Contributor: aimileus <me at aimileus dot nl>
# Maintainer: Fabio 'Lolix' Loli <lolix at disroot.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite
pkgver=9.2.1
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
sha256sums=('28acbcb6c5b8eb27c20329cd1a5ea3f1a27abb69812c4b1eeade4b91c89fc7d8'
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

  install    "${srcdir}/phoronix-test-suite-${pkgver}"/phoronix-test-suite \
             "${pkgdir}"/usr/bin/phoronix-test-suite

  ln -s /usr/bin/phoronix-test-suite "$pkgdir/usr/bin/pts"
}
