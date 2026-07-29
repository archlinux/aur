# Maintainer: JuiceyDev <me@juicey.dev>
# Contributor: JuiceyDev <me@juicey.dev>

pkgname=juicebox-plus-git
pkgver=r0.0000000
pkgrel=1
pkgdesc='System tray app for the Juicepipe file ingest daemon'
arch=('x86_64')
url='https://github.com/juiceboxdev/juicebox-plus'
license=('LGPL-3.0-or-later')
depends=('gtk3' 'libappindicator-gtk3' 'libdbus' 'libxdo' 'glibc')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=('juicebox-plus')
source=("git+https://github.com/juiceboxdev/juicebox-plus.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/juicebox-plus"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//; s/\([^-]*\)-\([^-]*\)-\(.*\)/r\2.\3/'
}

build() {
  cd "$srcdir/juicebox-plus"
  export CARGO_HOME="$srcdir/.cargo"
  cargo build --release --locked --frozen
}

check() {
  cd "$srcdir/juicebox-plus"
  export CARGO_HOME="$srcdir/.cargo"
  cargo test --release --locked --frozen
}

package() {
  cd "$srcdir/juicebox-plus"

  install -Dm755 "target/release/juicebox-plus" "$pkgdir/usr/bin/juicebox-plus"
  install -Dm644 "packaging/linux/juicebox-plus.desktop" "$pkgdir/usr/share/applications/juicebox-plus.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/juicebox-plus.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
