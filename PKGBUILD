# $Id: PKGBUILD 249884 2015-10-30 21:49:02Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Claire Charron <claire@undeterminant.net>

_pkgname=noto-fonts-emoji
pkgname=$_pkgname-git
pkgver=r81.9417128
pkgrel=2
pkgdesc="Google Noto emoji fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(Apache)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(fontconfig)
makedepends=(cairo git optipng python2-fonttools python2-setuputils nototools zopflipng-git)
install=$_pkgname.install
source=("$_pkgname::git+https://github.com/googlei18n/noto-emoji.git"
        "$_pkgname.patch")
sha512sums=('SKIP'
            '72f3c82ba3a1e69c158c3238c4c817df3e77302071ec1094fb284863ee72fb00117d89531ba75412501507984df4561ad013a09ac5742728c240bf073d80f4d0')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  patch -i ../$_pkgname.patch
  find -name '*.py' | xargs sed -e 's|/usr/bin/env python|/usr/bin/env python2|' -i
  sed -e 's|python|python2|g' -e 's|ttx "$<"|ttx2 "$<"|g' -i Makefile
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 NotoColorEmoji.ttf fonts/NotoEmoji-Regular.ttf "$pkgdir"/usr/share/fonts/noto
}
