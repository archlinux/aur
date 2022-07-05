# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3d-git
pkgver=1.1.r40.g818a0cb
pkgrel=1
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile (git version)'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('uavs3d')
conflicts=('uavs3d')
source=('git+https://github.com/uavs3/uavs3d.git'
        '010-uavs3d-10bit.patch')
sha256sums=('SKIP'
            '4cf38433b65937565935b922201e539eb0f5fd0ef32970b78b25f08c8e4519f1')

prepare() {
    [ -d uavs3d-10bit ] && rm -r uavs3d-10bit
    cp -a uavs3d uavs3d-10bit
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
}

pkgver() {
    git -C uavs3d describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd uavs3d
    cmake -B build/linux -S . \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCOMPILE_10BIT='0' \
        -Wno-dev
    make -C build/linux
    
    cd "${srcdir}/uavs3d-10bit"
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
    make -C uavs3d/build/linux DESTDIR="$pkgdir" install
    make -C uavs3d-10bit/build/linux DESTDIR="$pkgdir" install
    install -D -m755 uavs3d/build/linux/uavs3dec -t "${pkgdir}/usr/bin"
    install -D -m755 uavs3d-10bit/build/linux/uavs3dec "${pkgdir}/usr/bin/uavs3dec-10bit"
    install -D -m644 uavs3d/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
