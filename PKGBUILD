# Maintainer: Ricardo Band <email@ricardo.band>
# Maintainer: coon <coon@mailbox.org>

pkgname=sanic
pkgver=0.0.1
pkgrel=1
pkgdesc="chaos music control inspired by relaxx player"
arch=('any')
url=https://gitlab.com/xengi/sanic
license=('custom:MIT')
makedepends=('go')
source=("$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "${url}/-/archive/main/${pkgname}-main.tar.gz")
#        "${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('ecf53c83987bbb52b0fd0363180b7a81f02251c9406573c81dad6e4d5e3a590a'
            '23b7b98ac6ca3e071f099aa15411f7a451d93b55e5396020cf74ee8ce79defa4'
            'fb2834c0753c16f824986ad3c87de01f307ddf5cc8c04fd427e8abbf1863b52c'
            'SKIP')

prepare() {
  cd "$pkgname-main"

  mkdir -p build/
}

build() {
  cd "$pkgname-main"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "$pkgname-main"

  go test ./...
}

package() {
  cd "$pkgname-main"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

