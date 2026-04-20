# Maintainer: Shaun Lastra <shaun@revolvetrading.com>
pkgname=hyprglaze-git
pkgver=r1
pkgrel=1
pkgdesc="Wayland shader wallpaper daemon for Hyprland with window-aware effects and AI desktop buddy"
arch=('x86_64' 'aarch64')
url="https://github.com/slastra/hyprglaze"
license=('MIT')
depends=('wayland' 'mesa' 'libglvnd')
makedepends=('git' 'zig' 'wayland-protocols' 'stb')
optdepends=('aws-cli-v2: AI buddy via AWS Bedrock')
provides=('hyprglaze')
conflicts=('hyprglaze')
source=("git+https://github.com/slastra/hyprglaze.git")
sha256sums=('SKIP')

pkgver() {
    cd hyprglaze
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd hyprglaze
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd hyprglaze
    install -Dm755 zig-out/bin/hyprglaze "$pkgdir/usr/bin/hyprglaze"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shaders
    install -dm755 "$pkgdir/usr/share/hyprglaze/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/hyprglaze/shaders/"

    # Sprites
    install -dm755 "$pkgdir/usr/share/hyprglaze/sprites"
    install -Dm644 sprites/*.png "$pkgdir/usr/share/hyprglaze/sprites/"
}
