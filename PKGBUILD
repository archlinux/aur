# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fabio Austin Haedicke <austin.haedicke@gmail.com>

pkgname=phoronix-test-suite-git
pkgver=10.8.4.r77.gf665ba8
pkgrel=2
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=(any)
url="https://github.com/phoronix-test-suite/phoronix-test-suite"
license=(GPL-3.0-or-later)
depends=(php sh)
makedepends=(git)
optdepends=(python php-gd
            'sqlite3: required when running a Phoromatic server.'
            'gcc-fortran: required for universe-cli test suite'
            'blas: required for universe-cli test suite'
            'lapack: required for universe-cli test suite'
            'portaudio: required for universe-cli test suite'
            'unzip: required for universe-cli test suite'
            'mesa-demos: required for universe-cli test suite'
            'openmpi: required for universe-cli test suite'
            gmic
            hugin
            tesseract
            ocrmypdf
            rawtherapee
            gegl
            'python-mako: pts/libplacebo'
            'clang70: pts/oneapi-level-zero'
)
provides=(phoronix-test-suite)
conflicts=(phoronix-test-suite)
options=(!strip !debug)
source=("git+https://github.com/phoronix-test-suite/phoronix-test-suite.git"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/phoronix-test-suite-launcher.patch")
sha256sums=('SKIP'
            '577326343d0303a59fd469c3f9c9740e756dd59c0660c54363b62d6fd1cee26d')

pkgver() {
  cd "phoronix-test-suite"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "phoronix-test-suite"
  patch phoronix-test-suite -i "${srcdir}/phoronix-test-suite-launcher.patch"
}

package() {
  cd "phoronix-test-suite"
  ./install-sh ${pkgdir}/usr

  rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy
  rm -rf "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/{dependency-handlers,scripts,xml}/{*.php,*.sh,*.xml}

  install -D pts-core/external-test-dependencies/dependency-handlers/arch_dependency_handler.php -t \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/dependency-handlers/

  install -D pts-core/external-test-dependencies/scripts/install-arch-packages.sh -t \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/scripts/

  install -D pts-core/external-test-dependencies/xml/arch-packages.xml -t \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/xml/

  install -D pts-core/external-test-dependencies/xml/generic-packages.xml -t \
             "${pkgdir}"/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/xml/

  ln -s /usr/bin/phoronix-test-suite "${pkgdir}/usr/bin/pts"
}
