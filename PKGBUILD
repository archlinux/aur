# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgver=0.2.0-rc.1

pkgname=tutabridge-desktop
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Local IMAP/SMTP bridge for Tuta encrypted email (desktop app)'
arch=('x86_64' 'aarch64')
url='https://github.com/spartanz51/tutabridge'
license=('GPL-3.0-or-later')
depends=(webkit2gtk-4.1
         gtk3
         dbus
         libayatana-appindicator)
makedepends=(python
             rust
             cargo
             git
             cmake
             nasm
             pkgconf
             nodejs
             npm)
optdepends=('gnome-keyring: persist the Tuta session across reboots (Secret Service)'
            'kwallet: alternative Secret Service provider')
options=(!lto)
source=($pkgname::git+https://github.com/spartanz51/tutabridge.git#tag=v$_pkgver)
sha256sums=('064a59d7fce5d6e9a0670bf69f7a7a51af9ecc0076b92803b060c332b62eff6d')

prepare() {
  cd "$pkgname"

  # The Tuta Rust SDK is a git submodule and the build needs it.
  git submodule sync
  git submodule update --init --recursive
  python scripts/sdk-prepare.py

  # Fetch crates and frontend packages up-front so build() runs offline.
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked

  export npm_config_cache="$srcdir/npm-cache"
  (cd ui && npm ci)
}

build() {
  cd "$pkgname"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  # The GUI crate's build script embeds ui/dist, so the frontend goes first.
  (cd ui && npm run build)

  # Direct cargo builds need this feature to embed and serve the frontend
  # instead of loading devUrl; --release alone does not enable it.
  cargo build --release --frozen -p tutabridge-gui --features tauri/custom-protocol
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/tutabridge-gui" "$pkgdir/usr/bin/tutabridge-gui"
  install -Dm644 "packaging/linux/TutaBridge.desktop" "$pkgdir/usr/share/applications/TutaBridge.desktop"
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/tutabridge-gui.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/tutabridge-gui.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/tutabridge-gui.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
