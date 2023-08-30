# Maintainer: random-tm <lucia at luciaesmith dot com>
pkgname="apx-git"
_pkgname="apx"
pkgver=2.0.0.r54.gd2c156a
pkgrel=1
pkgdesc="Vanilla OS package manager"
arch=('x86_64')
url="https://github.com/Vanilla-OS/apx"
license=('GPL3')
depends=(
  'pacman>5'
  'git'
  'distrobox'
  'docker'
  )
makedepends=('go>=1.17')
options=(!lto)
conflicts=('apx')
provides=('apx')
source=(
  'apx::git+https://github.com/Vanilla-OS/apx.git#branch=main'
  'config.json'
  )
sha256sums=(
  'SKIP'
  '972073c7a632d624091ab4b1f88b761ac3309ee137bef53de33e543154502e71'
  )

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  go build -o apx main.go
}

package() {
  install -Dm755 "$srcdir/$_pkgname/apx" "$pkgdir/usr/bin/apx"
  install -Dm644 "$srcdir/$_pkgname/man/man1/apx.1" "$pkgdir/usr/share/man/man1/apx.1"

  # See: https://github.com/Vanilla-OS/apx/pull/248/files
  install -Dm644 "$srcdir/config.json" "$pkgdir/etc/apx/apx.json"
}
