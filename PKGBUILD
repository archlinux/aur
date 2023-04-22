# Maintainer: Horror Proton <https://github.com/horror-proton>

pkgname=maa-assistant-arknights
_pkgver=v4.15.0-beta.2
pkgver="$(echo ${_pkgver//-/} | sed -e 's/^v//')"
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
depends=(opencv onnxruntime cpr)
makedepends=(asio eigen git cmake)
source=("$url/archive/refs/tags/$_pkgver.tar.gz"
        'https://github.com/MaaAssistantArknights/FastDeploy/archive/1e4f600e5e5ab23528f77b98a8c5167b46ddfce2.tar.gz')
install="${pkgname}.install"
md5sums=('76eba4e9d960454823963de8d664d287'
         'be1dbba8bfc1ce42dc9fd1a9c74eb79f')

prepare() {
    cd "$srcdir"/MaaAssistantArknights-*
    sed -i 's/RUNTIME\sDESTINATION\s\./ /g; s/LIBRARY\sDESTINATION\s\./ /g; s/PUBLIC_HEADER\sDESTINATION\s\./ /g' CMakeLists.txt
    sed -i 's/find_package(asio /# find_package(asio /g' CMakeLists.txt
    sed -i 's/asio::asio/ /g' CMakeLists.txt
}

build() {
    cd "$srcdir"
    cmake -B build-fastdeploy -S FastDeploy-* \
        -DCMAKE_CXX_FLAGS=-fPIC \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX="$srcdir"/installed/usr
    cmake --build build-fastdeploy

    mkdir -p installed/usr
    cmake --install build-fastdeploy --prefix "$srcdir"/installed/usr

    cd "$srcdir"
    cmake -B build -S MaaAssistantArknights-* \
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
