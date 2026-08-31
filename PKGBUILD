# Maintainer: Malte Linke <me@parzival.space>

pkgname=eso-addons-manager
pkgdesc='Cross platform addon manager for the Elder Scrolls Online'
pkgver=0.4.23 # renovate: datasource=github-tags depName=arviceblot/eso-addons versioning=semver
pkgrel=1
arch=('x86_64')
url="https://github.com/arviceblot/eso-addons"
license=('MIT')
provides=('eso-addons-manager')
conflicts=('eso-addons-manager')
options=('!lto')
depends=(
  glibc
  gcc-libs
)
makedepends=(
  git
  cargo
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/arviceblot/eso-addons/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('338acb8f6d73642cfbf1d173f19e9b43203ce71cc528204657e9a05b8ce9218e')

prepare() {
  # directory name inside the tarball is eso-addons-<version>
  cd "$srcdir/eso-addons-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$srcdir/eso-addons-$pkgver"
  cargo build --frozen --release --no-default-features
}

package() {
  install -Dm755 "$srcdir/eso-addons-$pkgver/target/release/eso-addon-manager" "$pkgdir/usr/bin/eso-addon-manager"
  install -Dm644 "$srcdir/eso-addons-$pkgver/data/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/eso-addon-manager.png"
  install -Dm644 "$srcdir/eso-addons-$pkgver/data/eso-addon-manager.desktop" "$pkgdir/usr/share/applications/eso-addon-manager.desktop"
  install -Dm644 "$srcdir/eso-addons-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
