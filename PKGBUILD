# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Jaroslav Lichtblau
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=dosbox-debug
srcname=dosbox
pkgver=0.74
pkgrel=2
pkgdesc='Emulator with builtin DOS for running DOS games (includes debugger for DOS apps)'
arch=('x86_64' 'i686')
url='http://dosbox.sourceforge.net/'
license=('GPL')
depends=('sdl_net' 'zlib' 'sdl_sound' 'libgl' 'libpng' 'alsa-lib' 'gcc-libs' 'glu')
# libgl can be provided by mesa-libgl or the nVidia closed-source driver
makedepends=('libgl' 'gendesk>=0.5.3')
provides=('dosbox')
conflicts=('dosbox')
source=("http://downloads.sourceforge.net/$srcname/$srcname-$pkgver.tar.gz"
        'dosbox.png'
        'gcc46.patch')
md5sums=('b9b240fa87104421962d14eee71351e8'
         '2aac25fc06979e375953fcc36824dc5e'
         '3fba2e3c7c43290319b2928f40ed30e5')

prepare() {
  cd "$srcdir"

  gendesk --pkgname "$srcname" --pkgdesc "$pkgdesc" --exec "$srcname" --name "DOSBox"
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc" --terminal=true --name "DOSBox (debug)"
}

build() {
  cd "$srcdir/$srcname-$pkgver"

  patch -Np1 -i "$srcdir/gcc46.patch"
  sed -i 's/png_check_sig/png_sig_cmp/' configure

  # Compile alternate version with built-in debugger enabled
  ./configure   --prefix=/usr \
    --enable-debug \
    --sysconfdir=/etc/dosbox
  make
  mv src/dosbox src/dosbox-debug

  # Compile original version without DOS debugger
  ./configure   --prefix=/usr \
    --sysconfdir=/etc/dosbox
  make
}

package() {
  cd "$srcdir/$srcname-$pkgver"

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
