# Based on package by: Gustavo Rehermann
# Maintainer: VcalV

pkgname=ferroxide
_user="acheong08"
pkgver=0.5.0
pkgrel=1
pkgdesc="Hard fork of Hydroxide; a third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
makedepends=('go')
conflicts=('ferroxide-git')
url="https://github.com/$_user/$pkgname"
license=('MIT')
source=("${pkgname}-${pkgver}.tag.gz::https://github.com/$_user/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('884a5f3117ca35de9b2970469e1fcc3f13aacbfbc0a59a9ec30f148e74c3adb7c4c3bedbdbccbcd78227baeea28a7a1ca515fd52a54281a44178757b31528b81')


prepare(){
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o build ./cmd/...
}

check() {
	return 0; # No tests in package
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "${pkgname}-${pkgver}"
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 -t "$pkgdir/usr/bin" build/*
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
