# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=scribe-bin
pkgver=0.3.35
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
  '7d12eac0ddfc75125c5de38b7f672181cce57818fe40842aebb2bb6b5888818d'
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
