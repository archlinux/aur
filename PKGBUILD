# Maintainer: kaptoxic <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Louis des Landes <aur@psykar.com>
# Contributor: dlech
# Contributor: Andreas Harter <aur@andreas-harter.de>
 
pkgname=keebuntu-git
pkgver=0.5.6
pkgrel=1
pkgdesc="App indicator icon for keepass (for unity, cinnamon & gnome)"
arch=(any)
url="https://github.com/dlech/Keebuntu"
license=('GPL2')
md5sums=('SKIP')
depends=(
    keepass
    libappindicator-gtk2
    libappindicator-sharp
    libdbusmenu-gtk2
    libindicator-gtk2
    dbus-sharp-glib
    gtk-sharp-2
)
makedepends=('git' 'libappindicator-sharp')
source=('repo::git+https://github.com/dlech/Keebuntu.git')
install=$pkgname.install
 
_keepassdir=usr/share/keepass/appindicator
_icondir=icons/hicolor/256x256/apps
 
pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | sed 's#debian/##'
}
 
build() {
  cd "$srcdir/repo"
  sed -i 's|/usr/lib/keepass2|/usr/share/keepass|' KeePassExe.proj
  sed -i 's|libMagickWand-6.Q16.so|libMagickWand-6.Q16HDRI.so|' ImageMagick/ImageMagick.dll.config
  # aharter added these, I don't think they're needed though (psykar)
#  sed -i 's|dbus-sharp-glib, Version=2.0.0.0|dbus-sharp-glib, Version=1.0.0.0|' DBus/DBus.csproj
#  sed -i 's|dbus-sharp, Version=2.0.0.0|dbus-sharp, Version=1.0.0.0|' DBus/DBus.csproj
#  sed -i 's|dbus-sharp-glib, Version=2.0.0.0|dbus-sharp-glib, Version=1.0.0.0|' ApplicationIndicator/AppIndicatorPlugin.csproj
#  sed -i 's|dbus-sharp, Version=2.0.0.0|dbus-sharp, Version=1.0.0.0|' ApplicationIndicator/AppIndicatorPlugin.csproj
  xbuild /property:Configuration=Release ApplicationIndicator/AppIndicatorPlugin.csproj
}
 
package() {
  cd "$srcdir/repo"
  # Copy stuff across manually
  mkdir -p $pkgdir/$_keepassdir
  mkdir -p $pkgdir/usr/share/$_icondir
  cp ApplicationIndicator/bin/Release/* $pkgdir/$_keepassdir
  cp ApplicationIndicator/Resources/$_icondir/* $pkgdir/usr/share/$_icondir/
  # guzzard added these, shouldn't be needed though (psykar)
  #mkdir -p $pkgdir/usr/lib/mono/4.0
  #ln -s /usr/lib/mono/gac/dbus-sharp-glib/2.0.0.0__5675b0c3093115b5/dbus-sharp-glib.dll $pkgdir/usr/lib/mono/4.0/dbus-sharp-glib.dll
  #ln -s /usr/lib/mono/gac/dbus-sharp/2.0.0.0__5675b0c3093115b5/dbus-sharp.dll $pkgdir/usr/lib/mono/4.0/dbus-sharp.dll
  rm $pkgdir/$_keepassdir/KeePass.*
}
 
# vim:set ts=2 sw=2 et:
