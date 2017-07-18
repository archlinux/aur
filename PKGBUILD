# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-or-tools
pkgver=6.2
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python')
makedepends=('cmake')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('8d2a3aea8cf4a2c88647f4a7365a2140bf9fa80b34f8fd95ccfd54a6815fd2e7')

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
