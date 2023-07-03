# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

_fbxver=2020.3.4

pkgname=usd-fbx
pkgver=0.1
pkgrel=1
pkgdesc='FBX plugin for USD'
arch=(x86_64)
url='https://github.com/Remedy-Entertainment/usdFBX'
license=('Apache')
depends=(usd
         python
         gcc)
makedepends=(cmake)
options=(!lto)

source=("git+$url.git"
        "https://damassets.autodesk.net/content/dam/autodesk/www/adn/fbx/${_fbxver//./-}/fbx${_fbxver//./}_fbxsdk_linux.tar.gz"
        "https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.gz"
       )
sha512sums=('SKIP'
            '3cacaf23f43887942366a6cdc1d60bcca813bc1e137b3f9b0870ca80f4e505f4dc1f093f8a625075ba610318e09cb5f74d9fd94c53a05310ac3938b3c9e03d35'
            '6ab652c77dddc5a69cfc3f09974ba66f1413d699e49734c7ed31c629f5368230e0adaf95f599eafbf9316660d67b0b011b52ac1552d814564cbb2967bd927fdd')

prepare() {
    cd "${srcdir}"

    #FBX SDK
    mkdir -p fbx-sdk
    printf "yes\nn\n" | "${srcdir}/fbx${_fbxver//./}_fbxsdk_linux" "${srcdir}/fbx-sdk"

    #BOOST
    cd ${srcdir}/boost_1_78_0

    ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=python3
    ./b2 install \
    \
    --prefix="$srcdir"/boost
}

build() {
    _CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=/usr/share/usd/plugin/usd
        -DPXR_USD_LOCATION=/usr/share/usd
        -DADSK_FBX_LOCATION="${srcdir}"/fbx-sdk
        -DUSDFBX_BUILD_TESTS=ON
        -DBOOST_ROOT="${srcdir}"/boost
    )

    cmake -S usdFBX -B build -G Ninja "${_CMAKE_FLAGS[@]}"

    ninja -C build ${MAKEFLAGS:--j12}
}

package() {
    mkdir -p "${pkgdir}"/usr/share/usd/plugin/usd
    cp -r "${srcdir}"/build/plugins/usdFbx "${pkgdir}"/usr/share/usd/plugin/usd/usdFbx
}
