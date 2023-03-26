# Maintainer: Horror Proton <https://github.com/horror-proton>

pkgname=maa-assistant-arknights
_pkgver=v4.13.0-beta.1
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=2
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
depends=(opencv onnxruntime)
makedepends=(asio eigen git cmake)
source=("MaaAssistantArknights::git+$url.git#tag=$_pkgver"
        'FastDeploy::git+https://github.com/MaaAssistantArknights/FastDeploy.git')
install="${pkgname}.install"
md5sums=('SKIP'
         'SKIP')

prepare() {
    cd "$srcdir/MaaAssistantArknights"
    sed -i 's/RUNTIME\sDESTINATION\s\./ /g; s/LIBRARY\sDESTINATION\s\./ /g; s/PUBLIC_HEADER\sDESTINATION\s\./ /g' CMakeLists.txt
    sed -i 's/find_package(asio /# find_package(asio /g' CMakeLists.txt
    sed -i 's/asio::asio/ /g' CMakeLists.txt
}

build() {
    cd "$srcdir"
    cmake -B build-fastdeploy -S FastDeploy \
        -DCMAKE_CXX_FLAGS=-fPIC \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX="$srcdir"/installed/usr
    cmake --build build-fastdeploy

    mkdir -p installed/usr
    cmake --install build-fastdeploy --prefix "$srcdir"/installed/usr

    cd "$srcdir"
    cmake -B build -S MaaAssistantArknights \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_PREFIX_PATH="$srcdir"/installed/usr \
        -DCMAKE_CXX_FLAGS=-isystem\ "$srcdir"/installed/usr/include \
        -DUSE_MAADEPS=OFF \
        -DINSTALL_THIRD_LIBS=ON \
        -DINSTALL_RESOURCE=ON \
        -DINSTALL_PYTHON=ON \
        -DMAA_VERSION="$_pkgver"
    cmake --build build
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir"/usr
    mv -fv "$srcdir"/installed/usr/lib "$pkgdir"/usr
    cmake --install build --prefix "$pkgdir"/usr

    cd "$pkgdir"/usr
    mkdir -p share/"${pkgname}"
    mv Python share/"${pkgname}"
    mv resource share/"${pkgname}"
}
