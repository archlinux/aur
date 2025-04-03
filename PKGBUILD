# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3e
pkgver=1.3
pkgrel=1
pkgdesc='An AVS3 encoder supporting AVS3-P2 baseline profile'
arch=('x86_64')
url='https://github.com/uavs3/uavs3e/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
source=("git+https://github.com/uavs3/uavs3e.git#tag=v${pkgver}"
        '010-uavs3e-10bit.patch'
        '020-uavs3e-cmake4-fix.patch')
sha256sums=('8f0c7391751dd1b99d535e02128af545ea1f0e0d9177149615cd20741eaa8741'
            '644fc12d9f03f69c02034b06994c87fff4ebb2bdac02f98f3900ed390b95539c'
            'e480b19092673839a9382ecfe6dc4d936f79dbb1a95951d8fa392f7fc3050ea9')

prepare() {
    cp -a uavs3e uavs3e-10bit
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/010-uavs3e-10bit.patch"
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/020-uavs3e-cmake4-fix.patch"
    patch -d uavs3e -Np1 -i "${srcdir}/020-uavs3e-cmake4-fix.patch"
}

build() {
    # gcc 14 fix
    export CFLAGS+=' -Wno-incompatible-pointer-types -Wno-implicit-function-declaration'
    
    cd uavs3e
    cmake -B build/linux -S . \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCOMPILE_10BIT='0' \
        -Wno-dev
    make -C build/linux
    
    cd "${srcdir}/uavs3e-10bit"
    cmake -B build/linux -S . \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCOMPILE_10BIT='1' \
        -Wno-dev
    make -C build/linux
}

package() {
    make -C uavs3e/build/linux DESTDIR="$pkgdir" install
    make -C uavs3e-10bit/build/linux DESTDIR="$pkgdir" install
    install -D -m755 uavs3e/build/linux/uavs3enc -t "${pkgdir}/usr/bin"
    install -D -m755 uavs3e-10bit/build/linux/uavs3enc "${pkgdir}/usr/bin/uavs3enc-10bit"
    install -D -m644 uavs3e/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
