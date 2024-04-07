# Maintainer: aulonsal <seraur at aulonsal dot com>
pkgname=f2
pkgver=1.9.1
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/$pkgname"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
	'just'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1e7567eb9285c697fc787618d8f245c34b74ffdeaff9add19ff1d2d15fbabac2c5f65dda697c2e78817c96e1d0187bbeb9b4f25a42df763a582cfa3e8f9fca00')

build() {
	declare -x CGO_CPPFLAGS="${CPPFLAGS}"
	declare -x CGO_CFLAGS="${CFLAGS}"
	declare -x CGO_CXXFLAGS="${CXXFLAGS}"
	declare -x CGO_LDFLAGS="${LDFLAGS}"
	declare -x GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	just build
}

check() {
	cd "$pkgname-$pkgver"
	just test
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
