# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3d
pkgver=1.1
pkgrel=1
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
source=("git+https://github.com/uavs3/uavs3d.git#tag=v${pkgver}"
        '010-uavs3d-10bit.patch')
sha256sums=('SKIP'
            'a49296d0ce59fbb0dd4194505f077c69d0975018c1c8ae38a86f1780530e96ac')

prepare() {
    cp -a uavs3d uavs3d-10bit
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
}

build() {
    cd uavs3d
    cmake -B build/linux -S . \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -Wno-dev
    make -C build/linux
    
    cd "${srcdir}/uavs3d-10bit"
    cmake -B build/linux -S . \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -Wno-dev
    make -C build/linux
}

package() {
    make -C uavs3d/build/linux DESTDIR="$pkgdir" install
    make -C uavs3d-10bit/build/linux DESTDIR="$pkgdir" install
    install -D -m755 uavs3d/build/linux/uavs3dec -t "${pkgdir}/usr/bin"
    install -D -m755 uavs3d-10bit/build/linux/uavs3dec "${pkgdir}/usr/bin/uavs3dec-10bit"
    install -D -m644 uavs3d/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
