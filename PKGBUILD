# Maintainer: Sergio Tridente <tioduke (at) gmail (dot) com>
 
pkgname=keepass-plugin-statusnotifier-git
pkgver=0.6.0.r2.ga4abf97
pkgrel=1
pkgdesc="Provides a notification tray icon for KeePass on Plasma/KDE5."
arch=(any)
url="https://github.com/dlech/Keebuntu"
license=('GPL2')
md5sums=('SKIP')
depends=('keepass' 'dbus-sharp-glib' 'gtk-sharp-2')
makedepends=('git')
source=('repo::git+https://github.com/dlech/Keebuntu.git')
install=$pkgname.install
 
_keepassdir=usr/share/keepass/Plugins/statusnotifier
_icondir=icons
 
pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | sed 's#debian/##'
}
 
build() {
  cd "$srcdir/repo"
  sed -i 's|/usr/lib/keepass2|/usr/share/keepass|' KeePassExe.proj
  sed -i 's|libMagickWand-6.Q16.so|libMagickWand-6.Q16HDRI.so|' ImageMagick/ImageMagick.dll.config
  xbuild /property:Configuration=Release StatusNotifierPlugin/StatusNotifierPlugin.csproj
}
 
package() {
  cd "$srcdir/repo"
  # Copy stuff across manually
  mkdir -p $pkgdir/$_keepassdir
  mkdir -p $pkgdir/usr/share/$_icondir
  cp StatusNotifierPlugin/bin/Release/* $pkgdir/$_keepassdir
  cp -r StatusNotifierPlugin/Resources/$_icondir/* $pkgdir/usr/share/$_icondir/
  rm $pkgdir/$_keepassdir/KeePass.*
}
 
# vim:set ts=2 sw=2 et:
