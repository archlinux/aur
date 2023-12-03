# Maintainer: Horror Proton <https://github.com/horror-proton>

pkgname=maa-assistant-arknights
_pkgver=v4.28.0-beta.1
pkgver=${_pkgver//-/}
pkgver=${pkgver#v}
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL')
depends=(opencv onnxruntime cpr)
makedepends=(asio eigen git cmake)
_fastdeploy_ref=070424e06436524d817131d68c411066fa6069a6
source=("$url/archive/refs/tags/$_pkgver.tar.gz"
        "https://github.com/MaaAssistantArknights/FastDeploy/archive/$_fastdeploy_ref.tar.gz")
install="${pkgname}.install"
md5sums=('379b9abf380ff22e893169add6e6b85c'
         '34a2b705efbe3f27f0e29bdee4b24f03')

prepare() {
    cd "$srcdir"/MaaAssistantArknights-${_pkgver#v}
    sed -i 's/RUNTIME\sDESTINATION\s\./ /g; s/LIBRARY\sDESTINATION\s\./ /g; s/PUBLIC_HEADER\sDESTINATION\s\./ /g' CMakeLists.txt
    sed -i 's/find_package(asio /# find_package(asio /g' CMakeLists.txt
    sed -i 's/asio::asio/ /g' CMakeLists.txt

    find "src/MaaCore" \
        \( -name '*.h' -or -name '*.cpp' -or -name '*.hpp' -or -name '*.cc' \) \
        -exec sed -i 's/onnxruntime\/core\/session\///g' {} \;
    cp -v "$srcdir"/FastDeploy-"$_fastdeploy_ref"/cmake/Findonnxruntime.cmake cmake
    sed -i 's/ONNXRuntime/onnxruntime/g' CMakeLists.txt
}

build() {
    cd "$srcdir"
    CXXFLAGS="$CXXFLAGS -fmacro-prefix-map=$srcdir=/usr/src/debug/$pkgname"

    cmake -B build-fastdeploy -S FastDeploy-$_fastdeploy_ref \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DCMAKE_INSTALL_PREFIX="$srcdir"/installed/usr
    cmake --build build-fastdeploy

    mkdir -p installed/usr
    cmake --install build-fastdeploy --prefix "$srcdir"/installed/usr

    cd "$srcdir"

    CXXFLAGS="$CXXFLAGS \
    -isystem /usr/include/onnxruntime/core/session \
    -isystem $srcdir/installed/usr/include" \
    cmake -B build -S MaaAssistantArknights-${_pkgver#v} \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_PREFIX_PATH="$srcdir"/installed/usr \
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

    cd share/"${pkgname}"
    ln -s ../../lib/* .
}
