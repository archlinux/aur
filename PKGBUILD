# Maintainer: Alexej Magura <agm2819@*gmail*>

pkgname=tkman
pkgver=2.2
pkgrel=3
pkgdesc="man page and info file browser"
#epoch=0
arch=(any)
url="https://sourceforge.net/projects/tkman/"
license=('Artistic License')
depends=(polyglotman tk tcl sh)
makedepends=(dos2unix)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "gentoo.patch"
        "tkman-CVE-2008-5137.patch"
        "openbsd-gui_tcl.patch"
        tkman.sh)
md5sums=(0e81735c93ab2500d6105ff33095c3e8
         1d3e939dad772945a2435daff78ead76
         da154020b4e5e8978eb90f8b17bfa543
         221053c63a1989c34ca2191d7c58674d
         41ffdb3a149f81f4e0a7555afcfe48ca)

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  patch < "$srcdir"/gentoo.patch
  patch -p1 < "$srcdir"/tkman-CVE-2008-5137.patch
  dos2unix gui.tcl
  patch < "$srcdir"/openbsd-gui_tcl.patch
  #mv -v -- $pkgname $pkgname.tcl
  #cp -v -- "$srcdir"/tkman.sh tkman
  mv -v -- README-tkman README
  mv -v -- ANNOUNCE-tkman.txt ANNOUNCE
  cp -v -- "$srcdir"/tkman.sh .

  sed -i '${s|$| sh /usr/share/tkman/tkman.tcl|}' tkman.sh
}

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make WISH="/usr/bin/wish" BINDIR="/usr/bin"
  sed -i 's|/bin/sh|/usr/bin/sh|' $pkgname
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{share/{$pkgname/doc,pixmaps},bin}
  install -m644 tkman "$pkgdir"/usr/share/$pkgname/$pkgname.tcl
  install -m755 tkman.sh "$pkgdir"/usr/bin/tkman
  #echo "bash /usr/share/$pkgname/$pkgname.tcl" >> "$pkgdir"/usr/bin/tkman
  install -m644 -t "$pkgdir"/usr/share/$pkgname/doc CHANGES MANIFEST README manual.html
  install -m644 contrib/TkMan.xpm "$pkgdir"/usr/share/pixmaps
}
# vim:set ts=2 sw=2 et:
