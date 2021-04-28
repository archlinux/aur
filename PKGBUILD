# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
# Maintainer: chn <g897331845@gmail.com>

pkgname=xeus-cling
pkgver=0.12.1
pkgrel=1
pkgdesc="A C++ jupyter kernel based on xeus and cling"
arch=('x86_64')
url="https://github.com/jupyter-xeus/xeus-cling"
license=('BSD')
depends=('xtl' 'xproperty' 'xeus' 'nlohmann-json'
         'jupyter' 'jupyter-widgetsnbextension'
         'cling' 'pugixml' 'cxxopts')
makedepends=('cmake' 'cppzmq')
source=("https://github.com/jupyter-xeus/$pkgname/archive/$pkgver.tar.gz"
        "0001-Rename-kernels.patch"
        "0002-Use-llvm-from-cling.patch"
        "0003-put-config-file-at-etc.patch")
md5sums=('8831c891c059428b24148435d2305172'
         'e03c81c3701e4f0dea249955051c2ddf'
         '30e86ddf8e4996352eb456e12ec686bb'
         'fb1bf5fdaa53af1c010b9da9d29f63b6')

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

    if [ -z $CPLUS_INCLUDE_PATH ]
    then
        export CPLUS_INCLUDE_PATH=/opt/cling/include
    else
        export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/cling/include
    fi

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
