# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

_fbxver=2020.2.1

pkgname=usd-fileformat-plugins
pkgver=1.0.3
pkgrel=1
pkgdesc='Adobe collection of USD fileformat plugins'
arch=(x86_64)
url='https://github.com/adobe/USD-Fileformat-plugins'
license=(Apache-2.0)
depends=(usd
         python
         glibc
         gcc-libs
         boost-libs
         onetbb
         jemalloc
         zlib
         openimageio)
makedepends=(cmake)
options=(!lto)

source=("$pkgname::git+$url.git"
        "https://damassets.autodesk.net/content/dam/autodesk/www/adn/fbx/${_fbxver//./-}/fbx${_fbxver//./}_fbxsdk_linux.tar.gz"
       )
sha512sums=('SKIP'
            'f9a4b2ec7c114e4407ff318dade1ebd5cc18339a7a611bfa2bc4faf0a75b371b9947be80078b1f1f966890cd4ae3a2e091274fabd8cfff41c12bfc5b8ae6ed38')

prepare() {
    #FBX
    if [ ! -d "fbx-sdk" ]; then
        mkdir -p fbx-sdk
        printf "yes\nn\n" | "${srcdir}/fbx${_fbxver//./}_fbxsdk_linux" "${srcdir}/fbx-sdk"
    fi
}

build() {
    _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

    _CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=build/bin
        -DUSD_FILEFORMATS_ENABLE_CXX11_ABI=ON
        -DUSD_FILEFORMATS_BUILD_TESTS=OFF

        -Dpxr_ROOT=/usr
        -Dfmt_ROOT=/usr
        -DFBXSDK_ROOT=${srcdir}/fbx-sdk
        -DTinyGLTF_ROOT=/usr
    )

    cmake -S $pkgname -B build "${_CMAKE_FLAGS[@]}"

    cmake --build build --config release
    cmake --install build --config release
}

package() {
    mkdir -p ${pkgdir}/usr/lib/usd
    cp -r ${srcdir}/build/bin/plugin/usd $_/plugin
    rm ${pkgdir}/usr/lib/usd/plugin/plugInfo.json
    cp ${srcdir}/build/bin/lib/libfileformatUtils.so ${pkgdir}/usr/lib
}
