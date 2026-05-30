# Maintainer: d10n <david at bitinvert dot com>

pkgname=asciinema-agg-plus
pkgver=1.9.0
_tagver="plus-v$pkgver"
pkgrel=1
pkgdesc='asciinema gif generator fork with support for hinting and antialiasing'
arch=(x86_64)
url=https://github.com/d10n/agg-plus
license=(GPL-3.0-or-later)
makedepends=(cargo)
options=(!lto !debug)
source=(
    "agg-$_tagver.tar.gz::https://github.com/d10n/agg-plus/archive/refs/tags/$_tagver.tar.gz"
)
sha256sums=('a6489b5e5f572ac80d04c6263de72d13f49144b267d7cad7bed4a36d42d9825e')

prepare() {
  cd "$srcdir/agg-plus-$_tagver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/agg-plus-$_tagver"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/agg-plus-$_tagver"
  cargo test --frozen --release --all-targets
}

package() {
  cd "$srcdir/agg-plus-$_tagver"
  install -Dm0755 target/release/agg-plus "$pkgdir/usr/bin/agg-plus"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

