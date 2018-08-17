# $Id: PKGBUILD 274562 2017-12-16 10:55:46Z arojas $
# Maintainer: aimileus <me at aimileus dot nl>
# Maintainer: Fabio 'Lolix' Loli <lolix at disroot.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite
pkgver=8.0.1
pkgrel=2
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('any')
license=('GPL3')
url="http://www.phoronix-test-suite.com/"
depends=('php')
optdepends=('php-gd'
            'sqlite3: required when running a Phoromatic server.'
            'gcc-fortran: required for universe-cli test suite'
            'blas: required for universe-cli test suite'
            'lapack: required for universe-cli test suite'
            'portaudio: required for universe-cli test suite'
            'unzip: required for universe-cli test suite'
            'mesa-demos: required for universe-cli test suite'
            'openmpi: required for universe-cli test suite')
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/phoronix-test-suite/phoronix-test-suite/archive/v${pkgver}.tar.gz")
sha256sums=('8bfe972c601884f2bbbf4d5069c7691637e8a30af55d2a9597dbe53911b49081')

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

  sed -i "s#--noconfirm#--noconfirm --asdeps#" ${pkgdir}/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i ${pkgdir}/usr/bin/phoronix-test-suite
}
