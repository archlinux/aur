# Maintainer: Kunobi Ninja <feedback@kunobi.ninja>
# Builds the kobe CLI from the release source tarball. The CLI lives in the
# `kobectl` workspace crate and installs as the `kobe` binary.
# pkgver + checksum are refreshed by kunobi-ninja/kobe CI on each stable release.
pkgname=kobe
pkgver=0.39.0
pkgrel=1
pkgdesc='CLI for pools of pre-warmed Kubernetes virtual clusters'
arch=('x86_64' 'aarch64')
url='https://github.com/kunobi-ninja/kobe'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kunobi-ninja/kobe/archive/v$pkgver.tar.gz")
sha256sums=('601edec8e1dba1936cc138f413eb96305a27e437968f52a26bdc687d3fd0bdf1')

prepare() {
  cd "kobe-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "kobe-$pkgver"
  CARGO_TARGET_DIR=target cargo build --frozen --release -p kobectl
}

package() {
  cd "kobe-$pkgver"
  install -Dm0755 target/release/kobe "$pkgdir/usr/bin/kobe"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
