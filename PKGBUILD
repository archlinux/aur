# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=gopdf-git
pkgver=0.2.5.r0.g5f08452
pkgrel=2
pkgdesc="MuPDF-backend PDF viewer written in Go with Lua configuration"
arch=('x86_64')
url="https://github.com/Aethar01/gopdf.git"
license=('AGPL')
depends=('sdl3' 'libmupdf' 'gtk3')
makedepends=('go' 'git' 'pkgconf')
provides=('gopdf')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	go build -a -trimpath -ldflags "-linkmode=external -X main.version=${pkgver}" -o gopdf .
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 gopdf "$pkgdir/usr/bin/gopdf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 gopdf.desktop "$pkgdir/usr/share/applications/gopdf.desktop"
	install -Dm644 assets/gopdf.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gopdf.svg"
}
