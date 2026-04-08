# Hand-maintained PKGBUILD for Arch packaging.
# Maintainer: Parker - l3afyb0y/upstream dev
pkgname=changed
pkgver=0.5.9.r1.gc29b0e6
pkgrel=1
pkgdesc="Lightweight system tuning changelog daemon for Arch Linux (git version)"
arch=('x86_64')
url="https://github.com/l3afyb0y/changed"
license=('MIT')
depends=('systemd')
makedepends=('cargo' 'git' 'scdoc')
options=('!lto')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' \
    | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --locked --release
  scdoc < "docs/changed.1.scd" > "docs/changed.1"
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "build/cargo/release/changed" "$pkgdir/usr/bin/changed"
  install -Dm755 "build/cargo/release/changedd" "$pkgdir/usr/bin/changedd"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "docs/changed.1" "$pkgdir/usr/share/man/man1/changed.1"
  install -Dm644 "docs/changed.1.md" "$pkgdir/usr/share/doc/$pkgname/changed.1.md"
  install -Dm644 "example-log.md" "$pkgdir/usr/share/doc/$pkgname/example-log.md"

  install -Dm644 "packaging/systemd/system/changedd.service" \
    "$pkgdir/usr/lib/systemd/system/changedd.service"
  install -Dm644 "packaging/systemd/user/changedd.service" \
    "$pkgdir/usr/lib/systemd/user/changedd.service"
}
