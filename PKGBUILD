# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=galene
pkgver=0.1
pkgrel=1
pkgdesc="A videoconferencing server"
arch=('x86_64' 'i686')
url='https://galene.org'
license=('MIT')
install='galene.install'
depends=('go')
makedepends=('git')
source=("https://github.com/jech/$pkgname/archive/$pkgname-$pkgver.tar.gz"
        'galene.service'
        'galene.sysusers'
        'galene.tmpfiles')
sha256sums=('95e0231e2ec010af327455ff0173cecd9c2c32d86238b272aa247329f876ef2b'
            'eb27f57f04b9a1f5820880e006e299d657404e899add6f87ec524d2b554c9a7e'
            'a1b933ff4034cce2da2607e81df547acd7efa6f4236c18fec144047f50361f84'
            '85680da8ab202280b92b6dd32e920906570fb8070db06b2ef0275462d0f5a16d')

prepare() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  mkdir -p _build
}

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build \
     -trimpath \
     -buildmode=pie \
     -mod=readonly \
     -modcacherw \
     -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
     -o _build \
     ./...
}

check() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$srcdir"
  install -Dm644 galene.service "$pkgdir/usr/lib/systemd/system/galene.service"
  install -Dm644 galene.sysusers "$pkgdir/usr/lib/sysusers.d/galene.conf"
  install -Dm644 galene.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/galene.conf"

  cd "$pkgname-$pkgname-$pkgver"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "_build/galene" "_build/galene-password-generator" "${pkgdir}/usr/bin"

  install -dm755 "$pkgdir/usr/share/galene"
  cp -r static "$pkgdir/usr/share/galene"

  install -dm755 "$pkgdir/usr/share/doc/galene"
  install -m644 README README.FRONTEND "$pkgdir/usr/share/doc/galene"

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

  install -Dm644 data/ice-servers.json "$pkgdir/var/lib/galene/data/ice-servers.json"
}
