# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3d-git
pkgver=1.1.r47.g1fd0491
pkgrel=2
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile (git version)'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('uavs3d')
conflicts=('uavs3d')
source=('git+https://github.com/uavs3/uavs3d.git'
        '010-uavs3d-10bit.patch')
sha256sums=('SKIP'
            '4440d93d1cf3d3cec1130e030a06d6e61ff874ee93fd01a5cb272da73b9c3fa6')

prepare() {
    [ -d uavs3d-10bit ] && rm -r uavs3d-10bit
    cp -a uavs3d uavs3d-10bit
    
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
}

pkgver() {
    git -C uavs3d describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
