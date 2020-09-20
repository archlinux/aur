# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=got-git
_pkgname=${pkgname%-git}
pkgver=v0.4.0
pkgrel=1
pkgdesc='Simple golang package and CLI tool to download large files faster than cURL and Wget!'
arch=('x86_64' 'arm64')
url="https://github.com/melbahja/$_pkgname"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('go')
source=("git+https://github.com/melbahja/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname/cmd/$_pkgname"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X main.version=$pkgver" \
		-o got
}

check() {
	cd "$srcdir/$_pkgname"
	go test -v -race ./...
}

package() {
	cd "$_pkgname"
	install -Dm755 "cmd/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}
