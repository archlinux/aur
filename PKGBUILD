# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Armin Preiml <apreiml@strohwolke.at>

pkgname=hare
pkgver=r2696.1e039a84
pkgrel=1
pkgdesc='The Hare programming language'
arch=('x86_64')
url='https://harelang.org/'
license=('GPL3' 'MPL2')
depends=('qbe' 'harec')
makedepends=('git' 'scdoc')
_commit='1e039a8411948564b53fe53483afe4af6cf78b22'
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
  make check -j1
}

package() {
  cd hare

  make DESTDIR="$pkgdir" install
}
