# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

_fbxver=2020.3.7

pkgname=usd-fileformat-plugins
pkgver=1.0.10
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
         fast_float
         onetbb
         jemalloc
         zlib
         openimageio
         tinygltf)
makedepends=(cmake)
options=(!lto)

source=("$pkgname::git+$url.git"
        "https://damassets.autodesk.net/content/dam/autodesk/www/files/fbx${_fbxver//./}_fbxsdk_gcc_linux.tar.gz"
        "usd-monolithic.patch" # https://github.com/adobe/USD-Fileformat-plugins/pull/33
       )
sha512sums=('SKIP'
            'c2076ab34c4afe541f503643ea18e737cdb045973cc60811916feddeb75f7945d22b5537c40471c80cc1b0fb623556517d5c33e139e55e724701f7619a196cdb'
            'a7ad91b8292be62a65f83a13c62b92b45dcb6c703be02c98a976c0e11ea8d8aea0eba5b4cc21d9f12db79b182a7df81595916c3259ea844631dc42fb1c9316c7')

prepare() {
    #FBX
    if [ ! -d "fbx-sdk" ]; then
        mkdir -p fbx-sdk
        printf "yes\nn\n" | "${srcdir}/fbx${_fbxver//./}_fbxsdk_linux" "${srcdir}/fbx-sdk"
    fi

    # Fix monolithic build
    patch --directory="${srcdir}"/${pkgname} --forward --strip=1 --input="${srcdir}/usd-monolithic.patch"
}

build() {
    _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

    _CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=build/bin
        -DUSD_FILEFORMATS_ENABLE_CXX11_ABI=ON
        -DUSD_FILEFORMATS_ENABLE_MTLX=ON

        -DUSD_FILEFORMATS_FETCH_LIBXML2=OFF
        -DUSD_FILEFORMATS_FETCH_GTEST=OFF
        -DUSD_FILEFORMATS_FETCH_FMT=OFF
        -DUSD_FILEFORMATS_FETCH_TINYGLTF=ON # No cmake config file on AUR package
        -DUSD_FILEFORMATS_FETCH_FASTFLOAT=OFF
        -DUSD_FILEFORMATS_FETCH_HAPPLY=ON # .ply

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
