# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=scotty
pkgver=0.7.1
pkgrel=2
pkgdesc="Transfer listens and loves between music services"
arch=('x86_64')
url="https://git.sr.ht/~phw/scotty"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v${pkgver}")
sha256sums=('74370775d15be853afc6102ae9d030668398698a9e34c43f01bf987b8999d4c2')

prepare() {
	cd "$srcdir/$pkgname"
	GOPATH="${srcdir}" go mod download -x -modcacherw
}


build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	GOPATH="${srcdir}" go build
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname/config.example.toml" "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
	install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
