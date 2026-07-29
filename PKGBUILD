# Maintainer: JuiceyDev <me@juicey.dev>
# Contributor: JuiceyDev <me@juicey.dev>

pkgname=juicebox2-plus-git
pkgver=r0.0000000
pkgrel=1
pkgdesc='The companion app for juicebox!'
arch=('x86_64')
url='https://github.com/juiceboxdev/juicebox-plus'
license=('LGPL-3.0-or-later')
depends=('gtk3' 'libappindicator-gtk3' 'libdbus' 'libxdo' 'glibc')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=('juicebox2-plus')
source=("git+https://github.com/juiceboxdev/juicebox-plus.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/juicebox-plus"
  local desc=$(git describe --long --tags --always 2>/dev/null)
  if echo "$desc" | grep -q -- '-'; then
    echo "$desc" | sed 's/^v//; s/\([^-]*\)-\([^-]*\)-\(.*\)/r\2.\3/'
  else
    echo "r$(git rev-list --count HEAD).${desc}"
  fi
}

build() {
  cd "$srcdir/juicebox-plus"
  git submodule update --init
  export CARGO_HOME="$srcdir/.cargo"
  cargo build --release --locked
}

check() {
  cd "$srcdir/juicebox-plus"
  export CARGO_HOME="$srcdir/.cargo"
  cargo test --release --locked
}

package() {
  cd "$srcdir/juicebox-plus"

  install -Dm755 "target/release/juicebox-plus" "$pkgdir/usr/bin/juicebox-plus"
  install -Dm644 "packaging/linux/juicebox-plus.desktop" "$pkgdir/usr/share/applications/juicebox-plus.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/juicebox-plus.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
