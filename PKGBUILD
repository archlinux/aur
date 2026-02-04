# Maintainer: Mathias Maisberger <me@hiasinho.com>
pkgname=hammertalk-git
pkgver=r50.a569705
pkgrel=1
pkgdesc="Push-to-talk transcription daemon for Wayland (Sway, Hyprland, niri, COSMIC)"
arch=('x86_64')
url="https://github.com/hiasinho/hammertalk"
license=('MIT')
depends=('ydotool' 'gcc-libs')
makedepends=('git' 'rust' 'cargo')
optdepends=(
    'pipewire: audio capture'
    'pulseaudio: audio capture (alternative)'
)
provides=('hammertalk')
conflicts=('hammertalk')
install=hammertalk-git.install
source=("${pkgname}::git+https://github.com/hiasinho/hammertalk.git"
        "hammertalk.service")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"

    # Binary
    install -Dm755 "target/release/hammertalk" "$pkgdir/usr/bin/hammertalk"

    # Control script
    install -Dm755 "hammertalk-ctl" "$pkgdir/usr/bin/hammertalk-ctl"

    # Systemd user service (uses /usr/bin path)
    install -Dm644 "$srcdir/hammertalk.service" "$pkgdir/usr/lib/systemd/user/hammertalk.service"

    # Model download script
    install -Dm755 "download-model.sh" "$pkgdir/usr/share/hammertalk/download-model.sh"
}
