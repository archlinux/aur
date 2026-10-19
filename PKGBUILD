# Maintainer: kinker31 <www.kinker31.com>
# A lot of this code was copied from Maddie's GZDoom-git package

pkgname=uzdoom-git
pkgver=4.15pre+1953+gf49e8bc
pkgrel=2
pkgdesc='A fork of GZDoom, a feature-centric fork of ZDoom'
provides=(uzdoom)
conflicts=('uzdoom' 'uzdoom-bin')
arch=('x86_64')
url='https://github.com/UZDoom/UZDoom'
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'openmp' 'libvpx' 'hicolor-icon-theme' 'libwebp'
         'openal' 'sdl2-compat')
makedepends=('cmake' 'desktop-file-utils' 'git' 'ninja' 'python')
optdepends=('vulkan-driver: Vulkan renderer'
            'vulkan-icd-loader: Vulkan renderer'
            'waylandpp: Wayland Support')
options=(!lto)
source=('uzdoom::git+https://github.com/UZDoom/UZDoom.git')
sha256sums=('SKIP')

pkgver() {
    cd uzdoom
    git describe --tags --abbrev=7 --match '[Gg]*' | sed -r 's/^[Gg]//;s/-/+/g'
}

build() {
    cd uzdoom
    mkdir -p build
    cmake -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo  \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -G Ninja
    ninja -C build
}

package() {
    cd uzdoom
    DESTDIR="$pkgdir" ninja -C build install
    install -d "$pkgdir"/usr/share/licenses
    mv "$pkgdir"/usr/local/share/doc/uzdoom/licenses "$pkgdir"/usr/share/licenses/uzdoom
    install src/posix/zdoom.xpm -D -m 644 "$pkgdir"/usr/share/icons/hicolor/256x256/apps/uzdoom.xpm
}
