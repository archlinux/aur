# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

_fbxver=2020.3.4

pkgname=usd-fbx
pkgver=0.1
pkgrel=2
pkgdesc='FBX plugin for USD'
arch=(x86_64)
url='https://github.com/Remedy-Entertainment/usdFBX'
license=('Apache')
depends=(usd
         python
         boost
         gcc)
makedepends=(cmake)
options=(!lto)

source=("git+$url.git"
        "https://damassets.autodesk.net/content/dam/autodesk/www/adn/fbx/${_fbxver//./-}/fbx${_fbxver//./}_fbxsdk_linux.tar.gz"
       )
sha512sums=('SKIP'
            '3cacaf23f43887942366a6cdc1d60bcca813bc1e137b3f9b0870ca80f4e505f4dc1f093f8a625075ba610318e09cb5f74d9fd94c53a05310ac3938b3c9e03d35')

prepare() {
    cd "${srcdir}"

    #FBX SDK
    mkdir -p fbx-sdk
    printf "yes\nn\n" | "${srcdir}/fbx${_fbxver//./}_fbxsdk_linux" "${srcdir}/fbx-sdk"
}

build() {
    _CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=/usr/lib/usd/plugin
        -DUSD_CONFIG_FILE=/usr/lib/cmake/pxr/pxrConfig.cmake
        -DADSK_FBX_LOCATION="${srcdir}"/fbx-sdk
        -DUSDFBX_BUILD_TESTS=ON
    )

    cmake -S usdFBX -B build -G Ninja "${_CMAKE_FLAGS[@]}"

    ninja -C build ${MAKEFLAGS:--j12}
}

package() {
    mkdir -p "${pkgdir}"/usr/lib/usd/plugin
    cp -r "${srcdir}"/build/plugins/usdFbx "${pkgdir}"/usr/lib/usd/plugin/usdFbx
}
