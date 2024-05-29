# Maintainer: Konstantin Shurukhin <kshurukhin (at) gmail (dot) com 
pkgname=snx-rs-git
_pkgname=snx-rs
pkgver=2.2.1.r350.g0cf63a9
pkgrel=5
pkgdesc="Open source VPN client for Checkpoint security gateways (git version)"
arch=(x86_64)
url=https://github.com/ancwrd1/snx-rs
license=(AGPL-3.0-only)
depends=(gcc-libs glibc glib2 openssl gdk-pixbuf2 gtk3 webkit2gtk-4.1 systemd iproute2)
makedepends=(cargo sed git)
conflicts=(snx-rs)
source=(
  "git+https://github.com/ancwrd1/snx-rs.git"
)
sha256sums=(
  'SKIP'
)
install="snx-rs.install"

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf '%s.r%s.g%s' "$(git describe --tags --abbrev=0 | sed 's/[v\-]//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${srcdir}/${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{snx-rs,snxctl,snx-rs-gui}
  sed -i -re 's/^ExecStart.+/ExecStart=snx-rs -m command -l info/g' assets/snx-rs.service
  sed -i -re 's/\/opt\/snx-rs\///g' assets/snx-rs-gui.desktop
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" assets/snx-rs.service
  install -Dm0644 -t "$pkgdir/usr/share/applications/" assets/snx-rs-gui.desktop
  install -Dm0644 -t "$pkgdir/usr/share/snx-rs/" assets/snx-rs.conf
}
