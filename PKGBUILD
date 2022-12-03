# Maintainer: Clemmitt Sigler <cmsigler.online@gmail.com>

pkgname=agg-2.6-git
_pkgname=agg
pkgver=r151.e7db22b
_pkgver=2.6
pkgrel=1
pkgdesc='High Quality Rendering Engine for C++'
arch=('x86_64')
url='https://github.com/ghaerr/agg-2.6'
license=('BSD' 'custom:Anti-Grain Geometry Public License')
depends=('gcc-libs' 'sdl' 'freetype2')
makedepends=('git')
provides=('agg')
conflicts=('agg')
replaces=('antigrain')
source=("git+https://github.com/ghaerr/agg-2.6.git"
        'AGG-2.6-Anti-Grain-Geometry-Public-License.txt'
        'AGG-2.6-Modified-BSD-License.txt')
sha256sums=('SKIP'
            '74449c3b7082b77d63a23aba1c17ecc85c9dd292b3c6254f636746915d2c27b8'
            '308c93912836bb56fdd52c308bec06a5d3fe2b05947e35a89bab0bb52ce03d91')

pkgver() {
  cd "$_pkgname-$_pkgver"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname-$_pkgver/agg-src"

  autoupdate
  aclocal
  autoheader
  autoconf
  libtoolize -f
  automake --foreign -a -i
}

build() {
  cd "$_pkgname-$_pkgver/agg-src"

  # Do not use/remove GPC code to remove dependency on GPC license
  # See https://github.com/ghaerr/agg-2.6/blob/master/agg-web/license/index.html
  ./configure --prefix=/usr --disable-gpc --disable-static --disable-examples
  make
}

package() {
  make -C "$_pkgname-$_pkgver/agg-src" DESTDIR="$pkgdir" install

  # Do not use/remove GPC code to remove dependency on GPC license
  # See https://github.com/ghaerr/agg-2.6/blob/master/agg-web/license/index.html
  rm -f ./include/agg_conv_gpc.h "$pkgdir/usr/include/agg2/agg_conv_gpc.h"

  install -Dm644 AGG-2.6-Anti-Grain-Geometry-Public-License.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 AGG-2.6-Modified-BSD-License.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
