# Maintainer: eeegoloauq <eeegoloauq@users.noreply.github.com>
# Source PKGBUILD published to the AUR. The release workflow
# (.github/workflows/aur.yml) stamps pkgver/sha256sums, regenerates
# .SRCINFO and pushes on every v* tag — no manual bump needed.
# packaging/PKGBUILD is a separate binary-only variant used by CI
# to build the release .pkg.tar.zst.
pkgname=stashee
pkgver=0.2.0
pkgrel=1
pkgdesc="Glass-styled tiling terminal workspace over tmux"
arch=('x86_64' 'aarch64')
url="https://github.com/eeegoloauq/stashee-terminal"
license=('MIT')
depends=('gtk4' 'libadwaita' 'vte4' 'tmux')
makedepends=('cargo')
optdepends=('wl-clipboard: mouse-selection copy on Wayland'
            'xclip: mouse-selection copy on X11'
            'pipewire: microphone capture for voice input')
# makepkg's C/C++ LTO flags break ring's native assembly when a user
# selects lld (the default on some Arch derivatives such as Omarchy).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37bb31a03649c11c0237855637c6014530e9890e2a715a2dd3ef422d624da3b7')

prepare() {
  cd "stashee-terminal-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "stashee-terminal-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --workspace
}

check() {
  cd "stashee-terminal-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "stashee-terminal-$pkgver"
  install -Dm755 target/release/stashee "$pkgdir/usr/bin/stashee"
  install -Dm644 crates/stashee/data/dev.stashee.Terminal.desktop "$pkgdir/usr/share/applications/dev.stashee.Terminal.desktop"
  install -Dm644 crates/stashee/data/dev.stashee.Terminal.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.stashee.Terminal.svg"
  for s in 64 128 256; do
    install -Dm644 "crates/stashee/data/dev.stashee.Terminal-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/dev.stashee.Terminal.png"
  done
  install -Dm644 crates/stashee/data/dev.stashee.Terminal.metainfo.xml "$pkgdir/usr/share/metainfo/dev.stashee.Terminal.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
