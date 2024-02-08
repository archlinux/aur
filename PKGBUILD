# Maintainer: Horror Proton <https://github.com/horror-proton>

# shellcheck disable=SC2034 disable=SC2164
pkgname=maa-assistant-arknights
_pkgver=v5.1.0-beta.2
pkgver=${_pkgver//-/}
pkgver=${pkgver#v}
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL-3.0-only')
depends=(opencv onnxruntime cpr)
makedepends=(asio eigen git cmake)
_fastdeploy_ref=d0b018ac6c3daa22c7b55b555dc927a5c734d430
source=("$url/archive/refs/tags/$_pkgver.tar.gz"
        "https://github.com/MaaAssistantArknights/FastDeploy/archive/$_fastdeploy_ref.tar.gz")
install="${pkgname}.install"
md5sums=('2f4d88525e7bef29e65c1b833174bd94'
         '93190bbc6785e35e231af5cd4931f16a')

if ((WITH_GPU)); then
    depends+=( cuda )
fi

prepare() {
    cd "${srcdir:?}"/MaaAssistantArknights-${_pkgver#v}
    sed -e 's/RUNTIME\sDESTINATION\s\./ /g' \
        -e 's/LIBRARY\sDESTINATION\s\./ /g' \
        -e 's/PUBLIC_HEADER\sDESTINATION\s\./ /g' -i CMakeLists.txt
    sed -e 's/find_package(asio /# find_package(asio /g' \
        -e 's/find_package(MaaDerpLearning/# find_package(MaaDerpLearning/g' \
        -e 's/asio::asio/ /g' -i CMakeLists.txt
    sed -i "7i""add_subdirectory(\${SOURCE_DIR_FASTDEPLOY} \${BINARY_DIR_FASTDEPLOY} EXCLUDE_FROM_ALL SYSTEM) \\
        include_directories(SYSTEM \${SOURCE_DIR_FASTDEPLOY}) \\
        install(TARGETS MaaDerpLearning) \\
        message(\${CMAKE_CURRENT_LIST_FILE})" CMakeLists.txt

    shopt -s globstar nullglob
    sed -i 's/onnxruntime\/core\/session\///g' src/MaaCore/**/{*.h,*.cpp,*.hpp,*.cc}

    cp -v "$srcdir"/FastDeploy-"$_fastdeploy_ref"/cmake/Findonnxruntime.cmake cmake
    sed -i 's/ONNXRuntime/onnxruntime/g' CMakeLists.txt

    cd "$srcdir/FastDeploy-$_fastdeploy_ref"
    sed -i 's/fastdeploy_ppocr/MaaDerpLearning/g' CMakeLists.txt # git revert -n 0ef77d332
}

build() {
    cd "$srcdir"

    local _cmake_flags=(
        -DCMAKE_BUILD_TYPE=None
        -DUSE_MAADEPS=OFF
        -DINSTALL_RESOURCE=ON
        -DINSTALL_PYTHON=ON
        -DBUILD_SHARED_LIBS=ON
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
        -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
        -DMAA_VERSION="$_pkgver"
        -DSOURCE_DIR_FASTDEPLOY="$srcdir"/FastDeploy-"$_fastdeploy_ref"
        -DBINARY_DIR_FASTDEPLOY="$srcdir"/build-FastDeploy
    )

    if ((WITH_GPU)); then
        _cmake_flags+=( -DWITH_GPU=ON -DCUDA_DIRECTORY=/opt/cuda -DCUDA_ARCH_NAME=Auto )
    fi

    CXXFLAGS+=" -fmacro-prefix-map=$srcdir=${DBGSRCDIR:-/usr/src/debug}/${pkgbase:?}"
    CXXFLAGS+=" -isystem /usr/include/onnxruntime/core/session" # in case onnxruntime<=1.15

    cmake -B build -S "MaaAssistantArknights-${_pkgver#v}" "${_cmake_flags[@]}"
    cmake --build build
}

package() {
    cd "$srcdir"
    cmake --install build --prefix "$pkgdir"/usr

    cd "$pkgdir"/usr/
    mkdir -p share/"$pkgname"
    mv Python resource share/"$pkgname"
    ln -sr lib/* share/"$pkgname"
}
