# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=syngestures
_pkgname=syngesture
pkgver=1.0.1
pkgrel=4
pkgdesc="Swipes and gestures for Linux with the MT multitouch protocol"
arch=('x86_64')
url="https://github.com/mqudsi/syngesture"
license=('MIT')
makedepends=('cargo' 'git')
depends=('evtest')
optdepends=("wmctrl: needed for syngestures-switch-ws for X11 and Wayland compatible workspace switching"
            "xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps")
source=("git+$url.git#tag=$pkgver"
        "$pkgname.desktop"
        "$pkgname.toml"
        "$pkgname-switch-ws")
sha256sums=('SKIP'
            '244d8dc40c0bb6eea28a05c22b4a6950bbf0ecfc358cbc4c1500aae805f87883'
            '56496557c63baa472dc426ee0215c80b63859983bc6977078e34266bda5fce7b'
            '587366d03b3e70f8cbdd78f557bdf5191ff9937f9f86afa0d7ff78c490b015d8')
backup=("etc/$pkgname.toml")

prepare() {
  cd $_pkgname
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  # Patch config location
  cd src
  sed -i 's|PathBuf::from(PREFIX.unwrap_or("/usr/local"))|PathBuf::from(PREFIX.unwrap_or("/etc"))|' config.rs &&
  sed -i 's|format!("{}/etc/syngestures.toml", prefix.display())|format!("{}/syngestures.toml", prefix.display())|' config.rs &&
  sed -i 's|format!("{}/etc/syngestures.d/\*.toml", prefix.display())|format!("{}/syngestures.d/*.toml", prefix.display())|' config.rs
  sed -i 's|let global_config = prefix.join("etc/syngestures.toml");|let global_config = prefix.join("syngestures.toml");\n|' config.rs &&
  sed -i 's|let global_config_dir = prefix.join("etc/syngestures.d");|let global_config_dir = prefix.join("syngestures.d");\n|' config.rs
}

build() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

package() {
  install -Dm644 $pkgname.toml -t "$pkgdir/etc"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 $pkgname-switch-ws -t "$pkgdir/usr/bin"
  install -Dm755 $_pkgname/target/release/$pkgname -t "$pkgdir/usr/bin"
}
