# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-or-tools
pkgver=6.3
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python' 'swig')
makedepends=('cmake')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('f60fd9a39f1820a76d57919e87b47c98236c0860fedd5c6eb51c80d3a850b347')

build() {
    cd "${srcdir}/or-tools-${pkgver}"
    mkdir -p "dependencies/install/lib"
    pushd "dependencies/install"
    ln -s "lib" "lib64"
    popd
    make third_party -j1
    make python
}

package() {
    cd "${srcdir}/or-tools-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/python3.6/site-packages/"
    find ortools/ -name '*.py' -or -name '*.so' | xargs cp --parents -t "$pkgdir/usr/lib/python3.6/site-packages/"
    cp "lib/libortools.so" "$pkgdir/usr/lib/"
}
