# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=galene
pkgver=0.2
pkgrel=1
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
sha256sums=('ac43210dfab641940c37cba56bac90d2121584d4ba3473002130dcfef534cd7d'
            '2cb0143997c73b9dcc2ce82014358186695666ccfa7398cf4bd097fa558d38be'
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
  for file in README README.FRONTEND README.PROTOCOL; do
    pandoc --from=markdown --to html --standalone --shift-heading-level-by=-1 "$file" > "${doc}/${file}.html"
  done

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
