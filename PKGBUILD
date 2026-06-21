# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# Framebuffer-only build of mlterm: a modern terminal for the bare Linux console
# (no X11, no Wayland, no GTK). Truecolor, native sixel, fontconfig/freetype
# UTF-8 glyph fallback, gpm mouse. Runtime deps trimmed to what a desktop
# already ships.

pkgname=mlterm-fb
_srcname=mlterm
pkgver=3.9.4
pkgrel=1
pkgdesc='Framebuffer-only mlterm: truecolor + sixel + multilingual UTF-8 terminal on /dev/fb0 (no X/GTK)'
arch=('x86_64')
url='https://github.com/arakiken/mlterm'
license=('BSD')
depends=('freetype2' 'fontconfig' 'fribidi' 'gpm')
makedepends=('intltool' 'cairo' 'libssh2')
optdepends=('libssh2: built-in SSH support (libptyssh plugin)')
provides=('mlterm-fb')
conflicts=('mlterm')
source=("https://downloads.sourceforge.net/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('171de4c4f3443bc1211cc51df5caa0e082ffcdd33ab3ce261bc0a4cfe85d9b5e')

build() {
  cd "$srcdir/$_srcname-$pkgver"

  # mlterm 3.9.4 predates GCC 14 promoting these legacy-C warnings to hard
  # errors; downgrade them so the (benign) old pointer/int casts still compile.
  export CFLAGS+=" -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-implicit-function-declaration"

  # Only the framebuffer frontend — no xlib/gtk/wayland frontends are built.
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --with-gui=fb \
    --with-type-engines=cairo \
    --enable-fribidi \
    --enable-optimize-redrawing \
    --disable-static
  make
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  make DESTDIR="$pkgdir" install

  # libtool archives are not needed at runtime
  find "$pkgdir" -name '*.la' -delete

  # license
  install -Dm644 doc/en/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" 2>/dev/null \
    || install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null \
    || true
}
