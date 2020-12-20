# Maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>
_pkgname=galene
pkgname=$_pkgname-git
pkgver=0.1.r0.g6535775
pkgrel=1
pkgdesc="A videoconferencing server"
arch=('x86_64' 'i686')
url='https://galene.org'
license=('MIT')
provides=("$_pkgname")
install='galene.install'
depends=('go')
makedepends=('git')
source=("$_pkgname::git://github.com/jech/galene.git"
        'galene.service'
        'galene.sysusers'
        'galene.tmpfiles')
sha256sums=('SKIP'
            'eb27f57f04b9a1f5820880e006e299d657404e899add6f87ec524d2b554c9a7e'
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

  install -dm755 "$pkgdir/usr/share/doc/galene"
  install -m644 README README.FRONTEND "$pkgdir/usr/share/doc/galene"

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"

  install -Dm644 data/ice-servers.json "$pkgdir/var/lib/galene/data/ice-servers.json"
}
