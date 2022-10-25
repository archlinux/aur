# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-icd-loader-git
pkgver=1.3.231.r12.gceabdb1fa
pkgrel=1
arch=(x86_64)
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (git)'
url=https://www.khronos.org/vulkan
license=(custom)
makedepends=(cmake python-lxml libx11 libxrandr wayland vulkan-headers-git git)
depends=(glibc)
optdepends=('vulkan-driver: packaged vulkan driver') # vulkan-driver: vulkan-intel/vulkan-radeon/nvidia-utils/....
provides=("${pkgname%-git}" libvulkan.so)
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::git+https://github.com/KhronosGroup/Vulkan-Loader.git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVULKAN_HEADERS_INSTALL_DIR=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_DATADIR=/share \
        -DCMAKE_SKIP_RPATH=True \
        -DBUILD_TESTS=Off \
        -DBUILD_WSI_XCB_SUPPORT=On \
        -DBUILD_WSI_XLIB_SUPPORT=On \
        -DBUILD_WSI_WAYLAND_SUPPORT=On \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname%-git}"/LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
