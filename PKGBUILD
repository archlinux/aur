# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=rox
pkgver=2.11
pkgrel=7
pkgdesc="A small and fast file manager which can optionally manage the desktop background and panels"
arch=('x86_64')
license=('GPL')
url="http://rox.sourceforge.net/desktop/"
depends=('sh' 'libsm' 'gtk2')
makedepends=('librsvg' 'python')
source=("https://downloads.sourceforge.net/${pkgname}/rox-filer-${pkgver}.tar.bz2"
        'rox.desktop' 'rox.svg' 'rox.sh')
sha256sums=('a929bd32ee18ef7a2ed48b971574574592c42e34ae09f36604bf663d7c101ba8'
            '183ba9abb8ab84e36b59287977a79e45b5530c8026b3f0b8d3f6ff3f3e311320'
            '6d48e937bec9027aacc9e2828467161ed1488c1e8587eb37a5681d3852b824ea'
            '5b2f007e304220551cfecdca28333f5421ecfb3f084c4b44bd0cb2321dc51c40')

prepare() {
  cd "$srcdir/rox-filer-$pkgver"
  2to3 -w ROX-Filer/src/po/tips.py
}

build() {
  cd "$srcdir/rox-filer-$pkgver"
  ./ROX-Filer/AppRun --compile CFLAGS="$CFLAGS -fcommon" LIBS="-ldl -lm"
  # finally we render a png as fallback for svg unaware menu applications
  # Attention: always make sure you check the dimensions of the source-svg,
  # you can read the dimensions via inkscape's export function
  rsvg-convert -w 125 -h 100 -f png -o "$srcdir/rox.png" "$srcdir/rox.svg"
}

package() {
  cd "$srcdir/rox-filer-$pkgver"
  install -d "$pkgdir/usr/share/Choices/MIME-types"
  install -m755 Choices/MIME-types/* "$pkgdir/usr/share/Choices/MIME-types/"
  cp -rp ROX-Filer "$pkgdir/usr/share/"
  rm -fr "$pkgdir"/usr/share/ROX-Filer/{src,build}
 
  install -Dm755 "$srcdir/rox.sh" "$pkgdir/usr/bin/rox"
  install -Dm644 rox.1 "$pkgdir/usr/share/man/man1/rox.1"
  ln -sf rox.1 "$pkgdir/usr/share/man/man1/ROX-Filer.1"

  install -Dm644 "$srcdir/rox.desktop" "$pkgdir/usr/share/applications/rox.desktop"
  install -Dm644 "$srcdir/rox.svg" "$pkgdir/usr/share/pixmaps/rox.svg"
  install -Dm644 "$srcdir/rox.png" "$pkgdir/usr/share/pixmaps/rox.png"
}
