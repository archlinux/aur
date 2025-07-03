# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=ezchlog-git
_pkgname=${pkgname%-git}
pkgver=v1.0.2.r0.22d2311
pkgrel=2
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
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
	cargo build --locked --release
  mv target/release/$_pkgname $_pkgname
}

package() {
	cd "$srcdir/$_pkgname"
  install -D -t "$pkgdir/usr/bin" $_pkgname
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
