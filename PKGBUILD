# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: duapple <2832893880@qq.com>

pkgname=genmake
pkgver=0.5.0
pkgrel=1
_commit=18ba7e8
pkgdesc="Makefile template generator"
arch=('x86_64')
url="https://gitee.com/duapple/genmake"
license=('AGPL3')
depends=('glibc' 'genmake-templates')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/repository/archive/$_commit?format=tar.gz")
sha256sums=('0b8342216f00fc8314c36e09a98ebe7a39a716e5f1fdf4f7cc7aca4fa153bbea')

prepare() {
	cd "$pkgname-$_commit"
	rm genmake
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname-$_commit"
	go build -o build/genmake -ldflags "-linkmode=external -extldflags=${LDFLAGS}"
}

check() {
	cd "$pkgname-$_commit"
	go test ./...
}

package() {
	cd "$pkgname-$_commit"
	ln -s /usr/local/$pkgname/$pkgname $pkgname
	mkdir -p "$pkgdir/usr/bin/"
	install -D build/$pkgname -t "$pkgdir/usr/local/$pkgname/"
	install -Dm644 config/genmake_conf.json -t "$pkgdir/usr/local/$pkgname/config/"
	install -d "$pkgdir/usr/local/$pkgname/config/makefile/"
	mv $pkgname "$pkgdir/usr/bin/"
}
