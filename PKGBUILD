# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=opentyrian-git
pkgver=2.1.20260912
pkgrel=1
epoch=1
pkgdesc="Open-source port of the DOS shoot-em-up Tyrian"
url="https://github.com/opentyrian/opentyrian"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  glibc
  hicolor-icon-theme
  sdl2
  sdl2_net
)
makedepends=(git)
provides=(opentyrian)
conflicts=(opentyrian)
replaces=(
  opentyrian-hg
  opentyrian-svn
)
source=(
  git+https://github.com/opentyrian/opentyrian
  https://www.camanis.net/tyrian/tyrian21.zip
  0001-Fix-make-install.patch
)
b2sums=('SKIP'
        '6bef66fbc34a4d2d865fe7088a6942a29348153d0d10347860952a152b882fd9eef1748fbfa9fd32d030593d2f8c21e1cd227dd6ca540488ba5093b95a95fb33'
        '1ab8c02b141786eef9adb50444dc8fcf37397b2fad991e442da85b28a8a4520ccabf0a7483a7ed8730ae054a6da12d2d97ab0c6c8dbf19c0803b1baa0387d8d0')

prepare() {
  cd opentyrian
  git apply -3 ../0001-Fix-make-install.patch
}

pkgver() {
  git -C opentyrian describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

_make() {
  local make_options=(
    -C "$srcdir/opentyrian"
    prefix=/usr
    OPENTYRIAN_VERSION="$pkgver-$pkgrel"
    VCS_IDREV=false
  )

  make "${make_options[@]}" "$@"
}

build() {
  _make all
}

package() {
  _make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/games/tyrian" \
    tyrian21/{*.{dat,lvl,shp,snd},demo.*,music.mus,tyrend.anm,tyrian.{cdt,hdt,pic},tshp2.pcx}
}

# vim:set sw=2 sts=-1 et:
