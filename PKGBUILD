# Maintainer: avargas05 <avargas05.github@outlook.com>

pkgname=tabletsettings-git
pkgver=r2.116bd44
pkgrel=1
epoch=
pkgdesc="Calibrate tablet devices to a screen or window"
arch=('any')
url="https://github.com/avargas05/tabletsettings"
license=('GPL3')
groups=()
depends=('libwacom' 'gtk4')
makedepends=('meson' 'git' 'rustup')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"
  cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	arch-meson "$pkgname" bin --buildtype=release
	meson compile -C bin
}

package() {
	meson install --destdir "$pkgdir" -C bin
}
