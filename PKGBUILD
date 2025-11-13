# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=ezchlog-git
_pkgname=${pkgname%-git}
pkgver=1.2.0
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//;')"
}

build() {
  cd "$_pkgname"
  # strip installation info in README
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
  cargo build --locked --release
  mv target/release/$_pkgname $_pkgname
}

package() {
  cd "$_pkgname"
  install -D -t "$pkgdir/usr/bin" $_pkgname
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
