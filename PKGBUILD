# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=moor
pkgver=2.5.1
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/walles/moor"
license=(BSD-2-Clause-Views)
depends=(glibc)
makedepends=(go)
conflicts=(moar moar-bin moar-git)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('52b42419e565e2bc2aae0b3cbf4b4e6539e8a7daa5ba97c5384982e6fb8c2f40')

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
