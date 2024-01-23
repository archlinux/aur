# Maintainer: wansing <mail at wansing dot org>
pkgname=ulist
pkgver=0.14.4
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
	"ulist.sysusers"
	"ulist.tmpfiles"
)

validpgpkeys=('F433936B030F7FB97F4084E4C7C21DFFE932EF9D')
sha256sums=('13293cad0100a448040bb3683aa32033db6b06b42c00697374793f86d84a3a40'
            'efdf22898f12125f1ddfee0f0a55910d0d7372852e6275eec38c2f794f7a8e46'
            '358fdea45f6764941d14dd09cdfa520428dde2d7b341175cf7c2b9092924420d'
            'd2c1ade5e945be634ac132d72c922e21876595471f86f26372904938a063c93b'
            '8527c97aa40255bd4541e044ca4f2e47793a1c07db6034c66a657ec6e5c4542f')

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
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "../ulist.conf" "${pkgdir}/etc/ulist/ulist.conf"
  install -Dm644 "../ulist.service" "${pkgdir}/usr/lib/systemd/system/ulist.service"
  install -Dm644 "../ulist.sysusers" "${pkgdir}/usr/lib/sysusers.d/ulist.conf"
  install -Dm644 "../ulist.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ulist.conf"
}
