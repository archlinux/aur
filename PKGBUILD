# Maintainer: Malte Linke <me@parzival.space>

pkgname=eso-addons-manager
pkgdesc='Cross platform addon manager for the Elder Scrolls Online'
pkgver=0.4.18 # renovate: datasource=github-tags depName=arviceblot/eso-addons
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

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/arviceblot/eso-addons/archive/refs/tags/v$pkgver.tar.gz"
  "com.arviceblot.eso-addon-manager.desktop"
)
sha256sums=('eb46cfd270199bbde3b94d6e22f0049df840bd0c9b9a4aeacfe0b56a22d28487'
            '4fc6d1df6ca640527e1f7a2e7718d487cd1d5677785724b0803c76ef8e466e5e')

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
  install -Dm644 "$srcdir/eso-addons-$pkgver/data/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.arviceblot.eso-addon-manager.png"
  install -Dm644 "$srcdir/eso-addons-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file is no longer provided by the repository, so we provide our own based on a older version from source:
  # https://github.com/arviceblot/eso-addons/blob/9d29dbd588190646b55b9c7281dc3bae80aa10ae/data/com.arviceblot.eso-addon-manager.desktop
  install -Dm644 "$srcdir/com.arviceblot.eso-addon-manager.desktop" "$pkgdir/usr/share/applications/com.arviceblot.eso-addon-manager.desktop"
}
