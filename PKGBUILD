# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-or-tools
pkgver=6.7.2
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python' 'swig')
makedepends=('cmake' 'wget' 'lsb-release')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('3deb8140af664a01ddf42092c68bfa856e33a0ff4e297d4ba828b68de3ef838f9d7af1616de1ace72a92454783915df1')

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
