# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=moor
pkgver=2.0.1
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/walles/moar"
license=(BSD-2-Clause-Views)
depends=(glibc)
makedepends=(go)
conflicts=(moar moar-bin)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('ac6f99ac2dae2aeba5aea56ba79045968501b3708bb2b673e58d7d6118af8309')

prepare() {
	cd "$pkgname-$pkgver/cmd/moor"
	sed -i "s/var versionString = \"\"/var versionString = \"$pkgver\"/1" moor.go
}

build() {
	cd "$pkgname-$pkgver/cmd/moor"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver/cmd/moor"
	install -Dm755 moor "${pkgdir}/usr/bin/$pkgname"
	cd "../.."
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 moor.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
