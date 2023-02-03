# Maintainer: aulonsal <seraur at aulonsal dot com>
pkgname=f2
pkgver=1.9.0
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
b2sums=('553339e3d222a96c06d58a00cb6946270e3251bd72d7e72c17ff928ceaa43bbfa4233a48572c48963daca0271f01a1ceed113720538c2dcb22838888e0ecd9a0')

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
