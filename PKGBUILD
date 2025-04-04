# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3d
pkgver=1.1
pkgrel=3
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
source=("git+https://github.com/uavs3/uavs3d.git#tag=v${pkgver}"
        '010-uavs3d-10bit.patch')
sha256sums=('5104ececbacaa6dc12100bc994c853d021732eb5201136b02fa42bff364c588d'
            'a49296d0ce59fbb0dd4194505f077c69d0975018c1c8ae38a86f1780530e96ac')

prepare() {
    cp -a uavs3d uavs3d-10bit
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
}

build() {
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5.0'
        '-DCMAKE_SKIP_RPATH:BOOL=YES'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
    cmake -B build -S uavs3d "${_cmake_opts[@]}"
    cmake --build build
    
    cmake -B build-10bit -S uavs3d-10bit "${_cmake_opts[@]}"
    cmake --build build-10bit
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    DESTDIR="$pkgdir" cmake --install build-10bit
    install -D -m755 build/uavs3dec -t "${pkgdir}/usr/bin"
    install -D -m755 build-10bit/uavs3dec "${pkgdir}/usr/bin/uavs3dec-10bit"
    install -D -m644 uavs3d/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
