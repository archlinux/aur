# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# Framebuffer-only build of mlterm: a modern terminal for the bare Linux console
# (no X11, no Wayland, no GTK). Truecolor, native sixel, fontconfig/freetype
# UTF-8 glyph fallback, gpm mouse. Runtime deps trimmed to what a desktop
# already ships.

pkgname=mlterm-fb
_srcname=mlterm
pkgver=3.9.5
pkgrel=1
pkgdesc='Framebuffer-only mlterm: truecolor + sixel + multilingual UTF-8 terminal on /dev/fb0 (no X/GTK)'
arch=('x86_64')
url='https://github.com/arakiken/mlterm'
license=('BSD-3-Clause')
depends=('freetype2' 'fontconfig' 'fribidi' 'gpm')
makedepends=('intltool' 'cairo' 'libssh2')
optdepends=('libssh2: built-in SSH support (libptyssh plugin)')
provides=('mlterm-fb')
conflicts=('mlterm')
source=("https://downloads.sourceforge.net/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('7d28678aa90dade72cea4e1e5fffb5e4c343487d60ca36c88dc615134613af39')

build() {
  cd "$srcdir/$_srcname-$pkgver"

  # mlterm is old C that predates GCC 14 promoting these legacy warnings to hard
  # errors; downgrade them so the (benign) old pointer/int casts still compile.
  # Deliberately not named to a version — the note used to say "3.9.4", which
  # stopped being true the moment the version moved and told a later reader
  # nothing about whether the flags were still needed.
  export CFLAGS+=" -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-implicit-function-declaration"

  # Only the framebuffer frontend — no xlib/gtk/wayland frontends are built.
  #
  # --disable-image drops mlimgloader, which configure adds by default. With
  # --with-imagelib left at its default of no, that helper has no gdk-pixbuf
  # backend and loads images through libX11 instead — so on the bare console
  # this package targets, it links a library that need not be installed and
  # could not display anything if it were. namcap sees only the undeclared
  # libx11; the deeper point is that the binary cannot work here at all.
  #
  # Sixel is unaffected: mlterm decodes it in the terminal itself rather than
  # through the image loader.
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --with-gui=fb \
    --with-type-engines=cairo \
    --enable-fribidi \
    --enable-optimize-redrawing \
    --disable-image \
    --disable-static
  make
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  make DESTDIR="$pkgdir" install

  # libtool archives are not needed at runtime
  find "$pkgdir" -name '*.la' -delete

  # Upstream spells it LICENCE, at the root. This used to try doc/en/COPYING,
  # fall back to LICENSE, and end in `|| true` — three guesses, none of them the
  # actual filename, and a swallowed failure that turned the whole step into a
  # no-op. The package shipped with no licence file for as long as that stood.
  # Named exactly and allowed to fail: if upstream renames it, the build says so
  # rather than quietly dropping it again.
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
