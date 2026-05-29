# Maintainer: Miranda Collins (serqetry) miranda@xyla.net
# Contributor: Nebulosa <nebulosa2007-at-yandex-dot-ru>

_pkgname=atch
pkgname=${_pkgname}-stellar-git
pkgver=0.5
pkgrel=1
pkgdesc="Lets you attach and detach terminal sessions (with fixes needed by Stellar DE)"
arch=(x86_64)
url="https://github.com/mobydeck/atch"
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(
  bash
  lowdown
  git
)
provides=('atch')
conflicts=('atch')
options=(!debug)
source=("${pkgname}::git+https://github.com/miranda/atch.git#branch=timed-drain-filter")
b2sums=('SKIP')

prepare() {
  cd "$pkgname"
  sed -i 's/pandoc --standalone -t man/lowdown -s -Tman/' makefile
  sed -i 's/\$(STATIC_FLAG)//' makefile
}

build() {
  cd "$pkgname"
  make CC="gcc $CFLAGS -I. -Wno-unused-result" LDFLAGS="$LDFLAGS" VERSION="$pkgver"
  make man
}

package() {
  cd "$pkgname"
  install -vDm 755 "$_pkgname" -t "$pkgdir"/usr/bin/
  install -vDm 644 atch.1   -t "$pkgdir"/usr/share/man/man1/
}
