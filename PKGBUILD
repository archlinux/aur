# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Armin Preiml <apreiml@strohwolke.at>

pkgname=hare
pkgver=r2824.77613ea2
pkgrel=1
pkgdesc='The Hare programming language'
arch=('x86_64')
url='https://harelang.org/'
license=('GPL3' 'MPL2')
depends=('qbe' 'harec')
makedepends=('git' 'scdoc')
_commit='77613ea2dfba5bb22866968995c36a480861a3b3'
source=("hare::git+https://git.sr.ht/~sircmpwn/hare#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd hare

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd hare

  sed "s:/usr/local:/usr:" config.example.mk > config.mk
}

build() {
  cd hare

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  # XXX: parallel build driver builds are broken.
  LOCALVER=arch make -j1
}

check() {
  cd hare

  # XXX: see above, in build().
  #
  # Currently one test fails on glibc
  # https://lists.sr.ht/~sircmpwn/hare-dev/%3C2I5P65667M8XC.2AAFMEP64ZWLL%40mforney.org%3E
  #make check -j1
}

package() {
  cd hare

  make DESTDIR="$pkgdir" install
}
