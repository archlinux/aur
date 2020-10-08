# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=xeus-cling
pkgver=0.10.0
pkgrel=2
pkgdesc="A C++ jupyter kernel based on xeus and cling"
arch=('x86_64')
url="https://github.com/jupyter-xeus/xeus-cling"
license=('BSD')
depends=('xtl' 'xproperty' 'xeus' 'nlohmann-json'
         'jupyter' 'jupyter-widgetsnbextension'
         'cling-dev' 'pugixml' 'cxxopts')
makedepends=()
source=("https://github.com/jupyter-xeus/$pkgname/archive/$pkgver.tar.gz"
        "0001-Rename-kernels.patch"
        "0002-Use-llvm-from-cling.patch")
md5sums=('f81624ee2777dacfa5507bd448c174b5'
         'e03c81c3701e4f0dea249955051c2ddf'
         '30e86ddf8e4996352eb456e12ec686bb')

prepare() {
    cd "$pkgname-$pkgver"

    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DClang_DIR=/opt/cling/lib/cmake/clang \
        ..

    cmake --build .
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "build"

    DESTDIR="$pkgdir" cmake --build . -t install
}
