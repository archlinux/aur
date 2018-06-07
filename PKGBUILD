# Maintainer: Austin Haedicke <austin.haedicke@gmail.com>

# If you find errors or have suggestions feel free to file an issue
# or submit a pull request @ https://gtbjj.com/savagezen/pkgbuild 

pkgname=phoronix-test-suite-git
pkgver=8.0.0.r0.g81f7c7bed
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('any')
license=('GPL3')
url="http://www.phoronix-test-suite.com/"
depends=('php')
makedepends=('git')
optdepends=('python'
            'php-gd'
            'sqlite3: required when running a Phoromatic server.'
            'gcc-fortran: required for universe-cli test suite'
            'blas: required for universe-cli test suite'
            'lapack: required for universe-cli test suite'
            'portaudio: required for universe-cli test suite'
            'unzip: required for universe-cli test suite'
            'mesa-demos: required for universe-cli test suite'
            'openmpi: required for universe-cli test suite')
provides=('phoronix-test-suite')
conflicts=('phoronix-test-suite')
install=$pkgname.install
source=("$pkgname::git://github.com/phoronix-test-suite/phoronix-test-suite.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    ./install-sh $pkgdir/usr

    rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy

    sed -i "s#--noconfirm#--noconfirm --asdeps#" ${pkgdir}/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/scripts/install-arch-packages.sh
    sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i ${pkgdir}/usr/bin/phoronix-test-suite
}
