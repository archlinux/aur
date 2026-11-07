# Maintainer: guohw <guohw@aliyun.com>
pkgname=pixpin-linux-git
pkgver=r20.eb501e5
pkgrel=1
pkgdesc="Smart Screenshot, Pin and Offline OCR tool for Linux (PixPin port, niri/wlroots variant)"
arch=('x86_64')
url="https://github.com/go1em/pixpin-linux-niri"
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'tesseract' 'leptonica')
optdepends=(
    'grim: Wayland screenshot fallback when no portal Screenshot backend exists (niri/sway/Hyprland)'
    'xdg-desktop-portal-gnome: Wayland screenshot via XDG Desktop Portal'
    'python: RapidOCR advanced scene text recognition'
    'python-pip: Install rapidocr_onnxruntime'
)
provides=('pixpin')
conflicts=('pixpin' 'pixpin-linux' 'pixpin-linux-bin')
makedepends=('git' 'cmake' 'ninja' 'gcc')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
