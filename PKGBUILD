# Maintainer: Konstantin Shurukhin <kshurukhin (at) gmail (dot) com 
pkgname=snx-rs-git
_pkgname=snx-rs
pkgver=1.0.0.r271.g4c780ef
pkgrel=1
pkgdesc="Open source VPN client for Checkpoint security gateways (git version)"
arch=(x86_64)
url=https://github.com/ancwrd1/snx-rs
license=(AGPL-3.0)
depends=(gcc-libs glibc openssl systemd iproute2)
makedepends=(cargo sed)
optdepends=(
  'zenity: libadwaita systray dialogues (takes precedence over kdialog)'
  'kdialog: qt systray dialogues'
)
conflicts=(snx-rs)
source=(
  "git+https://github.com/ancwrd1/snx-rs.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf '%s.r%s.g%s' "$(git describe --tags --abbrev=0 | sed 's/\-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/{snx-rs,snxctl}
  sed -i -re 's/^ExecStart.+/ExecStart=snx-rs -m command -l info/g' assets/snx-rs.service
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" assets/snx-rs.service
}
