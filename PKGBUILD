# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=hilbish-git
pkgver=1.0.4.r3.g0113a4e
pkgrel=1
pkgdesc="The flower shell for Lua users"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('lua-lunacolors' 'lua-succulent' 'lua-inspect')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=hilbish.install
options=('!emptydirs')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD') ## TorchedSammy

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	sed -i '\|/etc/shells|d' Makefile
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	# make dev
	go build -ldflags "-linkmode=external -X main.version=$pkgver"
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
