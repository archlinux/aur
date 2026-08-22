# Maintainer: Emanuele Calo <emanuele.lele.calo@gmail.com>
pkgname=riso
pkgver=0.6.3
pkgrel=1
pkgdesc="Modular ricing framework: renders themes into the files a desktop reads"
arch=('x86_64' 'aarch64')
url="https://github.com/eldios/riso"
license=('MIT')
# No split debug package: it outlives the main one as an orphan.
options=('!debug')
# git and curl are called at run time to install themes and plugins.
depends=('git' 'curl')
makedepends=('cargo')
# The release tag is PGP-signed; makepkg verifies it before building.
validpgpkeys=('AA6BC7743F8F9AD84BBA15C72CCBF4B71EFFDD46')
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  cargo build --release --frozen
}

check() {
  cd "$pkgname"
  cargo test --release --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/riso" "$pkgdir/usr/bin/riso"
  install -Dm644 "docs/riso.1" "$pkgdir/usr/share/man/man1/riso.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
