# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=helium-d77
pkgver=0.3.0
pkgrel=1
pkgdesc="Wayland shell built with the Helium shell framework"
arch=('x86_64')
url="https://github.com/dani-77/helium-d77"
license=('MIT')
depends=('wayland' 'libglvnd' 'libxkbcommon' 'fontconfig' 'freetype2' 'pam' 'gcc-libs' 'glibc'
         'wl-clipboard' 'curl')
makedepends=('cargo' 'pkgconf' 'git')
backup=('etc/pam.d/helium-locker')
optdepends=(
  'alsa-utils: volume widget and OSD'
  'brightnessctl: brightness OSD'
  'power-profiles-daemon: power profile toggle'
  'swaybg: wallpaper backend'
  'ollama: backend for helium-ollama'
  'pciutils: GPU detection in helium-ollama'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('69cd869f7e4b9639c011d41c4505333a24fdb9b56e1871a95c1a3ff1e28be350')

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

    # Same binaries as the Makefile's BINS and the Void template.
    for bin in helium-shell helium-launcher helium-session helium-osd \
               helium-wallpaper helium-backdrop helium-ollama helium-locker; do
        install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    done
    install -Dm644 assets/d77-logo.svg "$pkgdir/usr/share/helium-d77/d77-logo.svg"
    install -Dm644 pam.d/helium-locker "$pkgdir/etc/pam.d/helium-locker"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 doc/TECHNICAL.md "$pkgdir/usr/share/doc/$pkgname/TECHNICAL.md"
}
