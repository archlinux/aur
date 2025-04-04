# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3e
pkgver=1.3
pkgrel=2
pkgdesc='An AVS3 encoder supporting AVS3-P2 baseline profile'
arch=('x86_64')
url='https://github.com/uavs3/uavs3e/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
source=("git+https://github.com/uavs3/uavs3e.git#tag=v${pkgver}"
        '010-uavs3e-10bit.patch')
sha256sums=('8f0c7391751dd1b99d535e02128af545ea1f0e0d9177149615cd20741eaa8741'
            '644fc12d9f03f69c02034b06994c87fff4ebb2bdac02f98f3900ed390b95539c')

prepare() {
    cp -a uavs3e uavs3e-10bit
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/010-uavs3e-10bit.patch"
}

build() {
    # gcc 14 fix
    export CFLAGS+=' -Wno-incompatible-pointer-types -Wno-implicit-function-declaration'
    
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        '-DCMAKE_INSTALL_PREFIX:PATH=/usr'
        '-DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5.0'
        '-DCMAKE_SKIP_RPATH:BOOL=YES'
        '-DBUILD_SHARED_LIBS:BOOL=ON'
        '-Wno-dev')
    
    cmake -B build -S uavs3e "${_cmake_opts[@]}" -DCOMPILE_10BIT='0'
    cmake --build build
    
    cmake -B build-10bit -S uavs3e-10bit "${_cmake_opts[@]}" -DCOMPILE_10BIT='1'
    cmake --build build-10bit
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    DESTDIR="$pkgdir" cmake --install build-10bit
    install -D -m755 build/uavs3enc -t "${pkgdir}/usr/bin"
    install -D -m755 build-10bit/uavs3enc "${pkgdir}/usr/bin/uavs3enc-10bit"
    install -D -m644 uavs3e/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
