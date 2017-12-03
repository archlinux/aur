# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-or-tools
pkgver=6.6
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python' 'swig')
makedepends=('cmake')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('59a12c3f04e29841cf1c6c56f784e6c721439f33fa10670ee13a47b8e33d1c046d07c760eae6438c327d7a7e4391c761')

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
