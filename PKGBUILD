# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=llama-git
pkgver=1.4.0.r1.gc32e9f7
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/antonmedv/llama"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('llama')
conflicts=('llama')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build/ -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\""
}

package() {
	cd "$pkgname"
	install -Dv build/llama -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

