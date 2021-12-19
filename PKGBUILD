# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=python-tikzplotlib-git
pkgver=0.9.16.r2.g1e30229
pkgrel=3
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
url="https://github.com/nschloe/tikzplotlib"
makedepends=(git python-build)
depends=(python python-matplotlib python-numpy python-pillow)
provides=("python-tikzplotlib=$pkgver")
conflicts=(python-matplotlib2tikz python-tikzplotlib)
replaces=(python-matplotlib2tikz)
license=(MIT)
arch=(any)
source=("tikzplotlib::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/tikzplotlib"
	git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
	cd "$srcdir/tikzplotlib"
	python -m build
}

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"

	cd "$srcdir/tikzplotlib"
	local cleanver="$(git describe --tags --abbrev=0 | sed 's/^v//')"
	unzip "dist/tikzplotlib-$cleanver-py3-none-any.whl" -d "$site"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
