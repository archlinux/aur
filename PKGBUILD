# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>
pkgname=moar
pkgver=1.23.9
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/walles/moar"
license=(BSD-2-Clause-Views)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/v$pkgver.tar.gz")
sha256sums=('0e88ff31268ba143e3c59e64751b16c720377c18afa257e2555a8c40ff66f69d')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i "s/Should be set when building, please use build.sh to build/$pkgver/1" moar.go
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 moar "${pkgdir}/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 moar.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
