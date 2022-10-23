# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=galene
pkgver=0.6.1
pkgrel=2
pkgdesc="A videoconferencing server"
arch=('x86_64' 'i686')
url='https://galene.org'
license=('MIT')
install='galene.install'
depends=('go')
makedepends=('git' 'pandoc')
source=("https://github.com/jech/$pkgname/archive/$pkgname-$pkgver.tar.gz"
        'galene.service'
        'galene.sysusers'
        'galene.tmpfiles')
sha256sums=('ea7ac0d0c5cff685e1d2a2e077d7197588fb570adfab1a1a924c87271f682f29'
            'a4f1d12c230d305124da4045f85c8c496f12f5202d9d82a6b560b1cfe0355ca0'
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

  local doc="$pkgdir/usr/share/doc/galene"
  install -dm755 "$doc"
  pandoc --from=markdown --to html --standalone --metadata title="Galène" README > "${doc}/README.html"
  for file in README.FRONTEND README.PROTOCOL; do
    pandoc --from=markdown --to html --standalone --shift-heading-level-by=-1 "$file" > "${doc}/${file}.html"
  done

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
