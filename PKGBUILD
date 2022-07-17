# Maintainer: Walter Broemeling <wallebroem at gmail dot com>

pkgname=dict-git
_name=dict
pkgver=r29.5f1c93d
pkgrel=1
pkgdesc="A dictionary, for the command line."
arch=('x86_64')
url="https://github.com/BetaPictoris/dict"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('dict')
conflicts=('dict')
source=('git+https://github.com/BetaPictoris/dict.git')
md5sums=('SKIP')

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_name"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o main ./main.go
}

package() {
	cd "$_name"
	install -Dm755 main "$pkgdir/usr/bin/dict"
	install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
