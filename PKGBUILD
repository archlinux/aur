# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=helium-d77
pkgver=0.1.10
pkgrel=1
pkgdesc="Wayland shell built with the Helium shell framework"
arch=('x86_64')
url="https://github.com/dani-77/helium-d77"
license=('MIT')
depends=('wayland' 'libglvnd' 'libxkbcommon' 'fontconfig' 'freetype2' 'pam' 'gcc-libs' 'glibc'
         'wl-clipboard' 'curl')
makedepends=('cargo' 'pkgconf' 'git')
optdepends=(
  'alsa-utils: volume widget and OSD'
  'brightnessctl: brightness OSD'
  'power-profiles-daemon: power profile toggle'
  'swaybg: wallpaper backend'
  'ollama: backend for helium-ollama'
  'pciutils: GPU detection in helium-ollama'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e5a573cc898bd8d036fdaff90dc48952901bb1bb96d4ee8f0a630b2f6221d744')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    # Same binaries as the Makefile's BINS and the Void template: helium-locker
    # is deliberately left out (upstream niri/layer-shika incompatibility, see
    # doc/TECHNICAL.md).
    for bin in helium-shell helium-launcher helium-session helium-osd \
               helium-wallpaper helium-backdrop helium-ollama; do
        install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    done
    install -Dm644 assets/d77-logo.svg "$pkgdir/usr/share/helium-d77/d77-logo.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 doc/TECHNICAL.md "$pkgdir/usr/share/doc/$pkgname/TECHNICAL.md"
}
