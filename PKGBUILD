# Maintainer: CPT Dawn <ping@cptdawn.dev>
pkgname=nexus-nm
pkgver=2.0.0
pkgrel=1
pkgdesc='A network manager for Wayland desktops: a user daemon and a TUI over NetworkManager'
arch=('x86_64' 'aarch64')
url='https://github.com/CPT-Dawn/Nexus'
license=('MIT')
depends=('glibc' 'gcc-libs' 'networkmanager')
makedepends=('cargo')
optdepends=('polkit: authorise Wi-Fi and Profile changes (see /usr/share/doc/nexus/POLKIT.md)'
            'iw: count the stations joined to a Hotspot'
            'xdg-utils: open a Portal login page in the browser (xdg-open)'
            'xdg-terminal-exec: open a terminal from notification actions (else $TERMINAL is used)')
provides=('nexus')
conflicts=('nexus' 'nexus-nm-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CPT-Dawn/Nexus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed2d9d24b18e8e7775b95b366b48cd80c5ff206e45311eab044e0c571d05be6b')

prepare() {
  cd "Nexus-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Nexus-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p nexus
}

check() {
  cd "Nexus-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The e2e suite needs a private dbus-daemon and optional tools; only the
  # self-contained packaging tests run here.
  cargo test --frozen --release -p nexus --test generate
}

package() {
  cd "Nexus-$pkgver"
  packaging/stage.sh target/release/nexus "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/nexus/README.md"
  install -Dm644 docs/polkit.md "$pkgdir/usr/share/doc/nexus/POLKIT.md"
}
