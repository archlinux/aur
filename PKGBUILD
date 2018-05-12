# Maintainer: ErnyTech <erny.castell[at]gmail[dot]com>

pkgname=mcpelauncher-erny
pkgver=20180512
pkgrel=1
pkgdesc="Launch MCPE on Linux!"
url="https://github.com/MCMrARM/mcpelauncher-linux"
arch=('x86_64')
license=('BSD 2-clause + Other')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libstdc++5' 'lib32-gtk2' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-nss' 'lib32-libxss' 'lib32-gconf' 'lib32-libxtst' 'lib32-libevdev' 'lib32-libprotobuf' 'lib32-libzip' 'lib32-curl')
makedepends=('cmake' 'lib32-zlib' 'lib32-libx11' 'lib32-libpng' 'lib32-util-linux' 'lib32-openssl' 'lib32-mesa' 'protobuf')
ptdepends=('protobuf' 'lib32-libprotobuf')
cefversion="3.3112.1653.gf69054f"
cef="cef_binary_${cefversion}_linux32_minimal"

source=('git+https://github.com/MCMrARM/mcpelauncher-linux.git'
        'git+https://github.com/MCMrARM/mcpelauncher-linux-bin.git'
        'git+https://github.com/MCMrARM/Google-Play-API.git'
        "http://opensource.spotify.com/cefbuilds/${cef}.tar.bz2"
        'mcpelauncher-icon.png'
        '0001-Separe-Cef-install-in-install-target.patch')
        
sha256sums=('SKIP'
        'SKIP'
        'SKIP'
        'aff4c87d5353a4c79a89eed537ad84bd9d138c2629b3df93670910d3273b7c11'
        '0ac038471fd5b48865c5f91342fd4ecdf3f7deaca28b2db9cd480e07466d6f31'
        '861c8d5a266cd7696835b63be7ddf232aa2cce98ab1e775f923c105edec60f1c')
        
prepare() {
    cp -r ${srcdir}/Google-Play-API/* ${srcdir}/mcpelauncher-linux/gplay_api
    cp -r ${srcdir}/mcpelauncher-linux-bin/* ${srcdir}/mcpelauncher-linux
    cp ${srcdir}/mcpelauncher-icon.png ${srcdir}/mcpelauncher-linux
    sed -i 's/^add_subdirectory(tests\//#&/' ${srcdir}/${cef}/CMakeLists.txt
    mkdir -p ${srcdir}/mcpelauncher-linux/libs/cef/res
    mkdir -p ${srcdir}/mcpelauncher-linux/libs/cef/res/locales
    mkdir -p ${srcdir}/mcpelauncher-linux/libs/cef/lib
    mkdir -p ${srcdir}/mcpelauncher-linux/libs/cef/include
    mkdir -p ${srcdir}/mcpelauncher-linux/libs/cef/bin
    
    cd ${srcdir}/mcpelauncher-linux
    patch -p1 < ${srcdir}/separe.patch
}

build() {
    # Compile cef binary
    mkdir -p ${srcdir}/${cef}/build && cd ${srcdir}/${cef}/build
    cmake -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_C_FLAGS=-m32 ..
    make
    cd ${srcdir}/${cef}
    cp -r include/* ${srcdir}/mcpelauncher-linux/libs/cef/include
    cp Resources/cef.pak Resources/cef_100_percent.pak Resources/cef_200_percent.pak Resources/cef_extensions.pak ${srcdir}/mcpelauncher-linux/libs/cef/res
    cp -r Resources/locales ${srcdir}/mcpelauncher-linux/libs/cef/res
    cp Resources/icudtl.dat ${srcdir}/mcpelauncher-linux/libs/cef/bin
    
    cp Release/libcef.so ${srcdir}/mcpelauncher-linux/libs/cef/lib
    cp Release/natives_blob.bin Release/snapshot_blob.bin ${srcdir}/mcpelauncher-linux/libs/cef/bin
    
    cp build/libcef_dll_wrapper/libcef_dll_wrapper.a ${srcdir}/mcpelauncher-linux/libs/cef/lib
    
    strip ${srcdir}/mcpelauncher-linux/libs/cef/lib/libcef.so
    
    
    
    # Compile mcpelauncher
    mkdir -p ${srcdir}/mcpelauncher-linux/build && cd ${srcdir}/mcpelauncher-linux/build
    cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr
    make
}

package() {
    cd ${srcdir}/mcpelauncher-linux/build
    make install
}
