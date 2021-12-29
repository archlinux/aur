# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: aimileus <me at aimileus dot nl>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite
pkgver=10.8.0
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=(any)
license=(GPL3)
url="http://www.phoronix-test-suite.com/"
depends=(php)
makedepends=(git)
optdepends=('php-gd'
            'sqlite3: required when running a Phoromatic server.'
            'gcc-fortran: required for universe-cli test suite'
            'blas: required for universe-cli test suite'
            'lapack: required for universe-cli test suite'
            'portaudio: required for universe-cli test suite'
            'unzip: required for universe-cli test suite'
            'mesa-demos: required for universe-cli test suite'
            'openmpi: required for universe-cli test suite')
source=("git+https://github.com/phoronix-test-suite/phoronix-test-suite.git#tag=v${pkgver}"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/phoronix-test-suite-launcher.patch")
sha256sums=('SKIP'
            '577326343d0303a59fd469c3f9c9740e756dd59c0660c54363b62d6fd1cee26d')
options=(!strip)

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -i "${srcdir}/phoronix-test-suite-launcher.patch" phoronix-test-suite
}

package() {
  cd "${srcdir}/${pkgname}"
  ./install-sh $pkgdir/usr

  rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy
  rm -rf "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/{dependency-handlers,scripts,xml}/{*.php,*.sh,*.xml}

  install -D "${srcdir}/${pkgname}"/pts-core/external-test-dependencies/dependency-handlers/arch_dependency_handler.php \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/dependency-handlers/arch_dependency_handler.php

  install -D "${srcdir}/${pkgname}"/pts-core/external-test-dependencies/scripts/install-arch-packages.sh \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/scripts/install-arch-packages.sh

  install -D "${srcdir}/${pkgname}"/pts-core/external-test-dependencies/xml/arch-packages.xml \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/xml/arch-packages.xml

  install -D "${srcdir}/${pkgname}"/pts-core/external-test-dependencies/xml/generic-packages.xml \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/xml/generic-packages.xml

  ln -s /usr/bin/phoronix-test-suite "${pkgdir}/usr/bin/pts"
}
