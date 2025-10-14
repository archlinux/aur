# Maintainer: wansing <mail at wansing dot org>
pkgname=litestream
pkgver=0.5.1
pkgrel=1
pkgdesc='Streaming S3 replication for SQLite.'
arch=('x86_64')
url='https://github.com/benbjohnson/litestream'
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=('sqlite')
source=(
  "$url/archive/v$pkgver.tar.gz"
  "litestream.sysusers"
  "litestream.tmpfiles"
  "litestream@.service"
)
sha256sums=('65f4d23f6dacc4154cdd4101ed2d0ae2b29394fd3e76609babd414912ad60445'
            'ff01a182a9138602692b9b55e01888bdf7a8c19f0f1c7be60bb165bd343dc7bf'
            '15775e0ad1842ace5683e2eb13b0d829a5d3df09e42c89fbc4daf82eef1897b4'
            'a13b26bf2886055647eb9fd607ca4b3b90b8faee457a13e9c043cee49220f1ba')

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
  install -Dm644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "../${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
