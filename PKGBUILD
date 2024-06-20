# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Fabrizio Pietrucci <bamlessnty5@gmail.com>

_pkgname=syngestures
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Swipes and gestures for Linux with the MT multitouch protocol (latest commit)"
url="https://github.com/mqudsi/syngesture"
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'git')
optdepends=("wmctrl: needed for syngestures-switch-ws for X11 and Wayland compatible workspace switching"
            "xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        "$_pkgname.desktop"
        "$_pkgname.toml"
        "$_pkgname-switch-ws")
sha256sums=('SKIP'
            '244d8dc40c0bb6eea28a05c22b4a6950bbf0ecfc358cbc4c1500aae805f87883'
            '56496557c63baa472dc426ee0215c80b63859983bc6977078e34266bda5fce7b'
            '587366d03b3e70f8cbdd78f557bdf5191ff9937f9f86afa0d7ff78c490b015d8')
backup=("etc/$pkgname.toml")

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_pkgname
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm644 $_pkgname.toml -t "$pkgdir/usr/local/etc"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $_pkgname/README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 $_pkgname-switch-ws -t "$pkgdir/usr/bin"
  install -Dm755 $_pkgname/target/release/$_pkgname -t "$pkgdir/usr/bin"
}
