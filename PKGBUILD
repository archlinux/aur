# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=frost-d77
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland desktop shell and session locker written in Rust"
arch=('x86_64')
url="https://github.com/dani-77/frost"
license=('MIT')
depends=('wayland' 'libglvnd' 'libxkbcommon' 'fontconfig' 'freetype2' 'pam' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
backup=('etc/pam.d/frost-locker')
optdepends=(
  'wireplumber: volume controls'
  'brightnessctl: brightness controls'
  'networkmanager: Wi-Fi status and nmtui'
  'power-profiles-daemon: power profile controls'
  'cmus: music controls'
  'swww: wallpaper backend'
  'curl: weather forecast'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('483414adaa5278d12ddc9a8496ed73f3053f94fb8b02e9997aa5a97c95a4803d')

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
