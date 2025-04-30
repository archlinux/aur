# Maintainer: wansing <mail at wansing dot org>
pkgname=ulist
pkgver=0.14.9
pkgrel=1
pkgdesc="A mailing list service that keeps it simple."
arch=('x86_64')
url="https://github.com/wansing/$pkgname"
license=('GPL')
depends=('glibc' 'sqlite')
makedepends=('go' 'postfix')
backup=('etc/ulist/ulist.conf')
source=(
	"$url/archive/v$pkgver.tar.gz"
	"ulist.conf"
	"ulist.service"
	"ulist@.service"
	"ulist.sysusers"
)

validpgpkeys=('F433936B030F7FB97F4084E4C7C21DFFE932EF9D')
sha256sums=('4782d516d25becbd2a4901b4805befe7de9104fe4ac4c0600d546cc630e482c0'
            'efdf22898f12125f1ddfee0f0a55910d0d7372852e6275eec38c2f794f7a8e46'
            'c85d6579b401cc6ea144152b0bbd361247327864fddd105085b83eecaa0ff39e'
            '14a0dd24a0ee5425c2ae324045a0b31a3b030d75080e44b16ff78dee2cbdef10'
            'd2c1ade5e945be634ac132d72c922e21876595471f86f26372904938a063c93b')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname      "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "../ulist.conf"     "${pkgdir}/etc/ulist/ulist.conf"
  install -Dm644 "../ulist.service"  "${pkgdir}/usr/lib/systemd/system/ulist.service"
  install -Dm644 "../ulist@.service" "${pkgdir}/usr/lib/systemd/system/ulist@.service"
  install -Dm644 "../ulist.sysusers" "${pkgdir}/usr/lib/sysusers.d/ulist.conf"
}
