# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-paint-git
pkgver=1.1.1.r0.gc73d031
pkgrel=1
pkgdesc='Library for abstraction of the Vulkan API (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD-2-Clause')
depends=(
    'gcc-libs'
    'glibc'
    'vulkan-icd-loader')
makedepends=(
    'cmake'
    'git'
    'glm'
    'glslang'
    'vulkan-headers')
provides=('cs-paint')
conflicts=('cs-paint')
options=('!emptydirs')
source=('git+https://github.com/copperspice/cs_paint.git')
sha256sums=('SKIP')

pkgver() {
    git -C cs_paint describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^paint\.//;s/^v//'
}

build() {
    cmake -B build -S cs_paint \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 cs_paint/src/*.h -t "${pkgdir}/usr/include"
    install -D -m644 cs_paint/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr"/{bin/CsPaintDemo,{include,lib/cmake}/glm,lib/pkgconfig/glm.pc}
}
