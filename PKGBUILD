# Maintainer: Ricardo Band <email@ricardo.band>
# Maintainer: coon <coon@mailbox.org>

pkgname=sanic
pkgver=0.0.1
pkgrel=1
pkgdesc="chaos music control inspired by relaxx player"
arch=('x86_64' 'aarch64')
url=https://gitlab.com/xengi/sanic
license=('MIT')
makedepends=('go')
source=("$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz?ref_type=tags")
sha256sums=('ecf53c83987bbb52b0fd0363180b7a81f02251c9406573c81dad6e4d5e3a590a'
            '23b7b98ac6ca3e071f099aa15411f7a451d93b55e5396020cf74ee8ce79defa4'
            'fb2834c0753c16f824986ad3c87de01f307ddf5cc8c04fd427e8abbf1863b52c'
            '509f39e01c009fa2abb064704bbe855a3e0969cb9c18c7174f4e097191b39350')

prepare() {
  cd "$pkgname-${pkgver}"

  mkdir -p build/
}

build() {
  cd "$pkgname-${pkgver}"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "$pkgname-${pkgver}"

  go test ./...
}

package() {
  cd "$pkgname-${pkgver}"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

