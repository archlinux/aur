# Maintainer: godlyfast <godlyfast@gmail.com>
pkgname=hyprwave-hifi-git
pkgver=r172.fa92871
pkgrel=1
pkgdesc="HyprWave HiFi - GTK4 Wayland music overlay with PipeWire visualization and per-application volume (git version)"
arch=('x86_64')
url="https://github.com/godlyfast/hyprwave-hifi"
license=('GPL-3.0-only')
depends=('gdk-pixbuf2' 'gtk4' 'gtk4-layer-shell' 'libpipewire')
makedepends=('gcc' 'pkgconf' 'git')
optdepends=(
    'libpulse: pactl support for per-application PipeWire/Pulse volume control'
    'pipewire: PipeWire daemon for audio visualization'
)
provides=('hyprwave')
conflicts=('hyprwave' 'hyprwave-hifi')
source=("$pkgname::git+https://github.com/godlyfast/hyprwave-hifi.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"

    # Install binary
    install -Dm755 hyprwave "$pkgdir/usr/bin/hyprwave"

    # Install toggle script
    install -Dm755 hyprwave-toggle.sh "$pkgdir/usr/bin/hyprwave-toggle"

    # Install data files
    install -Dm644 style.css "$pkgdir/usr/share/hyprwave/style.css"

    # Install icons
    install -dm755 "$pkgdir/usr/share/hyprwave/icons"
    install -m644 icons/*.svg "$pkgdir/usr/share/hyprwave/icons/"

    # Install themes
    install -dm755 "$pkgdir/usr/share/hyprwave/themes"
    install -m644 themes/*.css "$pkgdir/usr/share/hyprwave/themes/"

    # Install bundled font
    install -Dm644 fonts/VT323-Regular.ttf "$pkgdir/usr/share/fonts/TTF/VT323-Regular.ttf"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
