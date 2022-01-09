# Maintainer: Kasimir Wansing <kasimir at wansing dot org>
pkgname=ulist
pkgver=0.13.4
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
sha256sums=('3e191d29019a3279443b3c2bf66768ffa6596bda1f7dd336fc529acc28ec6b79'
            '208f682e3993c209877010a9f523e99b10db75667541f6078effc1300ea458cf'
            '9e3cac76882bb19cf9c2ae5d4daa69c8a5be5ffe688bd39133322d3c6b94b09a'
            '09f0ca7367d7b4a8200a6cab1a58da576ebc8d49277808fa4a4ec9a0f93760d8'
            'a52d0c60ea491cbcf31949fb1f0874a1e9442e466b588527dcf7a509a570de37')

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
