# Maintainer: Horror Proton <https://github.com/horror-proton>

# shellcheck disable=SC2034 disable=SC2164
pkgname=maa-assistant-arknights
_pkgver=v5.7.0-beta.2
pkgver=${_pkgver//-/}
pkgver=${pkgver#v}
pkgrel=1
pkgdesc="An Arknights assistant"
arch=(x86_64)
url="https://github.com/MaaAssistantArknights/MaaAssistantArknights"
license=('AGPL-3.0-only')
depends=(opencv onnxruntime cpr)
makedepends=(asio eigen git cmake)
_fastdeploy_ref=2896b6d3641c18218209c496ea149a773373fa8b
source=("$url/archive/refs/tags/$_pkgver.tar.gz"
        "https://github.com/MaaAssistantArknights/FastDeploy/archive/$_fastdeploy_ref.tar.gz")
install="${pkgname}.install"
md5sums=('4676c151ceefd0f5c66d1f5ff3184809'
         '795116aab12a8c2eda2a9c7498595ae7')

if ((WITH_CUDA)); then
    depends+=( cuda )
fi

build() {
    cd "${srcdir:?}"

    local _cmake_flags=(
        -DCMAKE_BUILD_TYPE=None
        -DUSE_MAADEPS=OFF
        -DINSTALL_RESOURCE=ON
        -DINSTALL_PYTHON=ON
        -DINSTALL_FLATTEN=OFF
        -DBUILD_SHARED_LIBS=ON
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
        -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
        -DMAA_VERSION="$_pkgver"
        -Dfastdeploy_SOURCE_DIR="$srcdir"/FastDeploy-"$_fastdeploy_ref"
        -Dfastdeploy_BINARY_DIR="$srcdir"/build-FastDeploy
    )

    if ((WITH_CUDA)); then
        _cmake_flags+=( -DWITH_CUDA=ON -DCUDA_DIRECTORY=/opt/cuda -DCUDA_ARCH_NAME=Auto )
    fi

    CXXFLAGS+=" -fmacro-prefix-map=$srcdir=${DBGSRCDIR:-/usr/src/debug}/${pkgbase:?}"

    cmake -B build -S "MaaAssistantArknights-${_pkgver#v}" "${_cmake_flags[@]}"
    cmake --build build
}

package() {
    cmake --install "$srcdir"/build --prefix "$pkgdir"/usr

    cd "$pkgdir"/usr/
    mkdir -p share/"$pkgname"
    mv Python resource share/"$pkgname"
    ln -sr lib/* share/"$pkgname"
}
