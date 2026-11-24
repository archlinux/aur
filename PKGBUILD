# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=frost-d77
pkgver=0.2.4
pkgrel=1
pkgdesc="Wayland desktop shell and session locker written in Rust"
arch=('x86_64')
url="https://github.com/dani-77/frost"
license=('MIT')
depends=('wayland' 'libglvnd' 'libxkbcommon' 'fontconfig' 'freetype2' 'pam' 'gcc-libs' 'glibc'
         'glib2' 'cliphist' 'wl-clipboard' 'xdg-utils' 'eww' 'dgop')
makedepends=('rust>=1:1.95' 'pkgconf')
backup=('etc/pam.d/frost-locker')
optdepends=(
  'wireplumber: volume controls'
  'dunst: notification history and do not disturb (alternative to swaync)'
  'swaync: notification control center (alternative to dunst)'
  'iproute2: network interface details in the dashboard'
  'procps-ng: CPU process details in the dashboard'
  'libpulse: react immediately to Pulse sink volume changes with pactl'
  'brightnessctl: brightness controls'
  'networkmanager: Wi-Fi status and nmtui'
  'power-profiles-daemon: power profile controls'
  'cmus: music controls'
  'tmux: start cmus from the dashboard'
  'screen: start cmus from the dashboard'
  'swww: wallpaper backend'
  'awww: wallpaper backend'
  'matugen: wallpaper-based color palette'
  'curl: weather forecast'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35580c802f5d636353ff434930644e0f8eb98793141ac88e7922e2c13bab4888')

prepare() {
    cd "frost-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "frost-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "frost-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" PAM_VARIANT=arch CARGO='cargo --frozen' install
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
