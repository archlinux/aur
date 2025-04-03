# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3d-git
pkgver=1.1.r47.g1fd0491
pkgrel=1
pkgdesc='An AVS3 decoder supporting AVS3-P2 baseline profile (git version)'
arch=('x86_64')
url='https://github.com/uavs3/uavs3d/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('uavs3d')
conflicts=('uavs3d')
source=('git+https://github.com/uavs3/uavs3d.git'
        '010-uavs3d-10bit.patch'
        '020-uavs3d-cmake4-fix.patch')
sha256sums=('SKIP'
            '4440d93d1cf3d3cec1130e030a06d6e61ff874ee93fd01a5cb272da73b9c3fa6'
            'cad4d6edf24c0a37bf243c839175a2f107a86a27c5e5157fab825591a2868b84')

prepare() {
    [ -d uavs3d-10bit ] && rm -r uavs3d-10bit
    cp -a uavs3d uavs3d-10bit
    
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/010-uavs3d-10bit.patch"
    patch -d uavs3d-10bit -Np1 -i "${srcdir}/020-uavs3d-cmake4-fix.patch"
    patch -d uavs3d -Np1 -i "${srcdir}/020-uavs3d-cmake4-fix.patch"
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
