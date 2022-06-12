# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Jaroslav Lichtblau
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=dosbox-debug
srcname=dosbox
pkgver=0.74.3
# Upstream version number
usver=0.74-3
pkgrel=1
pkgdesc='Emulator with builtin DOS for running DOS games (includes debugger for DOS apps)'
arch=('x86_64')
url='http://dosbox.sourceforge.net/'
license=('GPL')
depends=('sdl_net' 'zlib' 'sdl_sound' 'libgl' 'libpng' 'alsa-lib' 'gcc-libs' 'glu')
makedepends=('mesa-libgl' 'gendesk')
provides=('dosbox')
conflicts=('dosbox')
source=("http://downloads.sourceforge.net/$srcname/$srcname-$usver.tar.gz"
        'dosbox.png')
sha256sums=('c0d13dd7ed2ed363b68de615475781e891cd582e8162b5c3669137502222260a'
            '491c42d16fc5ef7ee2eca1b736f7801249d4ca8c0b236a001aec0d3e24504f3b')

# Can't use -Werror=format-security or the debug version fails to compile
options=(!buildflags)

prepare() {
  cd "$srcdir"

  gendesk -f --pkgname "$srcname" --pkgdesc "$pkgdesc" --exec "$srcname" --name "DOSBox"
  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --terminal=true --name "DOSBox (debug)"
}

build() {
  cd "$srcdir/$srcname-$usver"

  # Compile alternate version with built-in debugger enabled
  ./configure \
    --prefix=/usr \
    --enable-debug \
    --sysconfdir=/etc/dosbox
  make ${MAKEFLAGS}
  mv src/dosbox src/dosbox-debug

  # Compile original version without DOS debugger
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/dosbox
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$srcname-$usver"

  # Install everything including the non-debug binary
  make DESTDIR="$pkgdir" install

  # Install the debug binary
  install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # install docs, make does not install them
  install -Dm644 README "$pkgdir"/usr/share/doc/$srcname/README
  install -Dm644 docs/README.video "$pkgdir"/usr/share/doc/$srcname/README.video

  install -Dm644 "$srcdir/$srcname.png" \
    "$pkgdir/usr/share/pixmaps/$srcname.png"
  install -Dm644 "$srcdir/$srcname.desktop" \
    "$pkgdir/usr/share/applications/$srcname.desktop"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
