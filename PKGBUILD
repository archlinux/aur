# Maintainer: Shaun Lastra <shaun@revolvetrading.com>
pkgname=hyprglaze-git
pkgver=r240.164ec18
pkgrel=1
pkgdesc="Wayland shader wallpaper daemon for Hyprland with window-aware effects and AI desktop buddy"
arch=('x86_64' 'aarch64')
url="https://github.com/slastra/hyprglaze"
license=('MIT')
depends=('hyprland>=0.55' 'wayland' 'mesa' 'libglvnd' 'libpulse')
makedepends=('git' 'zig>=0.16' 'stb')
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
    # Binary, shaders, sprite sheet and systemd user units, laid out by
    # build.zig (the compile itself is cached from build()).
    zig build -Doptimize=ReleaseSafe --prefix "$pkgdir/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
