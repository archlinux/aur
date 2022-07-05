# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=uavs3e-git
pkgver=r210.gb4c1df4
pkgrel=1
pkgdesc='An AVS3 encoder supporting AVS3-P2 baseline profile (git version)'
arch=('x86_64')
url='https://github.com/uavs3/uavs3e/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('uavs3e')
conflicts=('uavs3e')
source=('git+https://github.com/uavs3/uavs3e.git'
        '010-uavs3e-10bit.patch')
sha256sums=('SKIP'
            '644fc12d9f03f69c02034b06994c87fff4ebb2bdac02f98f3900ed390b95539c')

prepare() {
    [ -d uavs3e-10bit ] && rm -r uavs3e-10bit
    cp -a uavs3e uavs3e-10bit
    patch -d uavs3e-10bit -Np1 -i "${srcdir}/010-uavs3e-10bit.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C uavs3e rev-list --count HEAD)" "$(git -C uavs3e rev-parse --short HEAD)"
}

build() {
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
