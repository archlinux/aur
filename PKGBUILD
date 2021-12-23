pkgname=vk-layer-flimes-git
pkgver=1.1.0.r0.g74b074d
pkgrel=1
pkgdesc="Vulkan frame limiter"
arch=('x86_64')
url="https://github.com/zaps166/vk-layer-flimes"
license=('MIT')
makedepends=('git' 'cmake' 'vulkan-headers')
optdepends=('vk-layer-flimes-gui-git: GUI for external framerate control')
source=("git+https://github.com/zaps166/vk-layer-flimes.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vk-layer-flimes"
    git describe --long --tags | cut -c 2- | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/vk-layer-flimes"
    mkdir -p build-64
    cd build-64
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make

    cd "${srcdir}/vk-layer-flimes"
    mkdir -p build-32
    cd build-32
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib32 -DCOMPILE_32_BIT=ON
    make
}

package() {
    cd "${srcdir}/vk-layer-flimes/build-32"
    DESTDIR=${pkgdir} make install

    cd "${srcdir}/vk-layer-flimes/build-64"
    DESTDIR=${pkgdir} make install

    install -Dm644 "${srcdir}/vk-layer-flimes/LICENSE" "$pkgdir/usr/share/licenses/vk-layer-flimes/LICENSE"
}
