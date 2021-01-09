# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
_pkgname=galene
pkgname=$_pkgname-git
pkgver=0.1.r49.g50a3d8b
pkgrel=1
pkgdesc="A videoconferencing server"
arch=('x86_64' 'i686')
url='https://galene.org'
license=('MIT')
provides=("$_pkgname")
install='galene.install'
depends=('go')
makedepends=('git' 'pandoc')
source=("git://github.com/jech/galene.git"
        'galene.service'
        'galene.sysusers'
        'galene.tmpfiles')
sha256sums=('SKIP'
            '2cb0143997c73b9dcc2ce82014358186695666ccfa7398cf4bd097fa558d38be'
            'a1b933ff4034cce2da2607e81df547acd7efa6f4236c18fec144047f50361f84'
            '85680da8ab202280b92b6dd32e920906570fb8070db06b2ef0275462d0f5a16d')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^galene-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p _build
}

build() {
  cd "$srcdir/$_pkgname"
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
  cd "$srcdir/$_pkgname"
  go test ./...
}

package() {
  cd "$srcdir"
  install -Dm644 galene.service "$pkgdir/usr/lib/systemd/system/galene.service"
  install -Dm644 galene.sysusers "$pkgdir/usr/lib/sysusers.d/galene.conf"
  install -Dm644 galene.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/galene.conf"

  cd "$_pkgname"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "_build/galene" "_build/galene-password-generator" "${pkgdir}/usr/bin"

  install -dm755 "$pkgdir/usr/share/galene"
  cp -r static "$pkgdir/usr/share/galene"

  local doc="$pkgdir/usr/share/doc/galene"
  install -dm755 "$doc"
  for file in README README.FRONTEND README.PROTOCOL; do
    pandoc --from=markdown --to html --standalone --shift-heading-level-by=-1 "$file" > "${doc}/${file}.html"
  done

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
}
