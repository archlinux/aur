# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=scribe-bin
pkgver=0.3.40
pkgrel=1
pkgdesc='A native GNOME Markdown editor that renders your document as you type (upstream binary)'
arch=('x86_64')
url='https://github.com/gnacho/scribe'
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'enchant'
  'gdk-pixbuf2'
  'glib2'
  'glibc>=2.34'
  'graphene'
  'gtk4>=4.14'
  'gtksourceview5>=5.10'
  'hicolor-icon-theme'
  'libadwaita>=1.5'
  'libgcc'
  'pango'
)
provides=("scribe=$pkgver")
conflicts=('scribe' 'scribe-git')
options=('!strip' '!debug')

_debrel=1
_debfile="scribe_${pkgver}-${_debrel}_amd64.deb"
source=(
  "https://github.com/gnacho/scribe/releases/download/v${pkgver}/${_debfile}"
  # The upstream .deb still omits the symbolic application icon.
  "scribe-${pkgver}-symbolic.svg::https://raw.githubusercontent.com/gnacho/scribe/v${pkgver}/data/icons/hicolor/symbolic/apps/io.github.gnacho.Scribe-symbolic.svg"
)
noextract=("$_debfile")
sha256sums=(
  'd13e3470ae1569bbab145205b6426d7f4f6977b717b50cccbb966d3f1e4cc2d6'
  '4c2870aeb700ce429d98e6e9a17229517d1bdf676c5a6043e76c4cecfc26e4eb'
)

package() {
  bsdtar -xf "$srcdir/$_debfile" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -Dm644 "$srcdir/scribe-${pkgver}-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.gnacho.Scribe-symbolic.svg"

  install -d "$pkgdir/usr/share/licenses"
  mv "$pkgdir/usr/share/doc/scribe" "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$pkgdir/usr/share/doc"
}
