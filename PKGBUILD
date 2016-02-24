# vim:set ts=2 sw=2 et:
# Maintainer: orumin <dev@orum.in>

pkgname=previous-svn
pkgver=r635
pkgrel=1
pkgdesc="NeXTSTEP Emulator"
arch=('i686' 'x86_64')
url="http://previous.alternative-system.com"
license=('GPL')
depends=('sdl2')
makedepends=('subversion' 'cmake' 'unzip')
replaces=('previous')
conflicts=('previous')
provides=('previous')
source=(previous::svn://svn.code.sf.net/p/previous/code/branches/branch_realtime
        http://galgot.free.fr/transit/PReV-icons-WOshad.zip
        previous.desktop
        previous-icon.patch
        previous-romdefault.patch)
noextract=('PReV-icons-WOshad.zip')
install='previous-svn.install'
md5sums=('SKIP'
         '4d9be2cb0c3d6fe0bce550af8bb6c85d'
         '2b66542a8f0efb7a3c8eaec062400afb'
         '57aed380d85bd8264fb37b7b537f3f62'
         '0e20ed0b6a33cf4badb529c18a69c397')

_svntrunk=svn://svn.code.sf.net/p/previous/code/branches/branch_realtime
_svnmod=previous

pkgver() {
  cd "$srcdir/previous"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch -p1 < ../previous-icon.patch
  patch -p1 < ../previous-romdefault.patch

  ./configure --prefix=/usr
  make
}

package() {
  mkdir -p $srcdir/icons
  cd $srcdir/icons
  unzip -u $srcdir/PReV-icons-WOshad.zip
  cd HighResOSX-WOshadow.iconset

  #mkdir -p $pkgdir/usr/share/icons/hicolor/16x16/apps
  #mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
  #mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  #mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
  #mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/{16x16,32x32,128x128,256x256,512x512}/apps
  

  cp icon_16x16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/previous-app.png
  cp icon_32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/previous-app.png
  cp icon_128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/previous-app.png
  cp icon_256x256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/previous-app.png
  cp icon_512x512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/previous-app.png

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/previous.desktop $pkgdir/usr/share/applications


  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
  cp "$srcdir/$_svnmod-build"/src/Rev_* "$pkgdir"/usr/share/previous/
  cp "$srcdir/$_svnmod-build"/src/dimension_eeprom.bin  "$pkgdir"/usr/share/previous/
}
