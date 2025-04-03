# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3e-git
pkgver=r212.ge1ff0f3
pkgrel=1
pkgdesc='An AVS3 encoder supporting AVS3-P2 baseline profile (git version)'
arch=('x86_64')
url='https://github.com/uavs3/uavs3e/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('uavs3e')
conflicts=('uavs3e')
source=('git+https://github.com/uavs3/uavs3e.git'
        '010-uavs3e-10bit.patch'
        '020-uavs3e-cmake4-fix.patch')
sha256sums=('SKIP'
            '218ee9ad8e6df4af2bd155dd237cd0c934f8f4edbb16ebd100f62ff66ae90681'
            'e480b19092673839a9382ecfe6dc4d936f79dbb1a95951d8fa392f7fc3050ea9')

prepare() {
    [ -d uavs3e-10bit ] && rm -r uavs3e-10bit
    cp -a uavs3e uavs3e-10bit
    
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/010-uavs3e-10bit.patch"
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/020-uavs3e-cmake4-fix.patch"
    patch -d uavs3e -Np1 -i "${srcdir}/020-uavs3e-cmake4-fix.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C uavs3e rev-list --count HEAD)" "$(git -C uavs3e rev-parse --short HEAD)"
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
