# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=helium-d77
pkgver=0.5.1
pkgrel=1
pkgdesc="Wayland shell built with the Helium shell framework"
arch=('x86_64')
url="https://github.com/dani-77/helium-d77"
license=('MIT')
depends=('wayland' 'libglvnd' 'libxkbcommon' 'fontconfig' 'freetype2' 'pam' 'gcc-libs' 'glibc'
         'wl-clipboard' 'curl' 'eww' 'dgop')
makedepends=('cargo' 'pkgconf' 'git')
backup=('etc/pam.d/helium-locker')
optdepends=(
  'alsa-utils: volume widget and OSD'
  'brightnessctl: brightness OSD'
  'power-profiles-daemon: power profile toggle'
  'swaybg: wallpaper backend'
  'ollama: backend for helium-ollama'
  'pciutils: GPU detection in helium-ollama'
  'matugen: theme colors from the wallpaper'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('141caab87cc05a577bc070c0603b585a61c7b7dfaac233af5bd139bb4a1b4078')

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

    # One `helium` binary; every program is a helium-<applet> symlink to it,
    # as in the Makefile and the Void template.
    install -Dm755 target/release/helium "$pkgdir/usr/bin/helium"
    for applet in shell launcher session osd wallpaper backdrop ollama locker; do
        ln -s helium "$pkgdir/usr/bin/helium-$applet"
    done
    install -Dm644 assets/d77-logo.svg "$pkgdir/usr/share/helium-d77/d77-logo.svg"
    install -Dm755 monitor/d77-monitor "$pkgdir/usr/share/helium-d77/monitor/d77-monitor"
    install -Dm644 monitor/eww.yuck "$pkgdir/usr/share/helium-d77/monitor/eww.yuck"
    install -Dm644 monitor/eww.scss "$pkgdir/usr/share/helium-d77/monitor/eww.scss"
    install -Dm644 pam.d/helium-locker "$pkgdir/etc/pam.d/helium-locker"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 doc/TECHNICAL.md "$pkgdir/usr/share/doc/$pkgname/TECHNICAL.md"
}
