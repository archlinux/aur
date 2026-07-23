# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=stoml
pkgver=0.7.1
pkgrel=1
pkgdesc="Simple TOML parser for Bash"
arch=('x86_64')
url="https://github.com/freshautomations/stoml"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f7be982307e83fce09d50aa5cd3f841c6b7d7d9863dc196dbee4fa22c13f7e5d07d659c62362ac8541e19be3b3b6c575be52911e11ffc0988833a857a6081e1e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o $pkgname
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
}
