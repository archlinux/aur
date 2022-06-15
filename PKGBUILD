# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>

pkgname=keepass2-plugin-tray-icon
pkgver=0.8.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Functional tray icon for KeePass2"
license=('GPL2')
depends=('keepass' 'dbus-sharp-glib' 'gtk-sharp-2')
makedepends=('git' 'mono-msbuild')
url="https://github.com/dlech/Keebuntu"
source=("repo::git+https://github.com/dlech/Keebuntu.git#tag=debian/${pkgver}")
md5sums=('SKIP')
sha512sums=('SKIP')

build() {
  cd "$srcdir/repo" || exit
  sed -i 's|/usr/lib/keepass2|/usr/share/keepass|' KeePassExe.proj
  sed -i 's|libMagickWand-6.Q16.so|libMagickWand-6.Q16HDRI.so|' ImageMagick/ImageMagick.dll.config
  msbuild /property:Configuration=Release DBus/DBus.csproj
  msbuild /property:Configuration=Release GtkStatusIcon/GtkStatusIconPlugin.csproj
}

package() {
  mkdir -p "${pkgdir}/usr/share/keepass/plugins"
  install -m644 "${srcdir}/repo/DBus/bin/Release/DBus.dll" "${pkgdir}/usr/share/keepass/plugins/"
  install -m644 "${srcdir}/repo/GtkStatusIcon/bin/Release/GtkStatusIcon.dll" "${pkgdir}/usr/share/keepass/plugins/"
  cp -r "${srcdir}/repo/GtkStatusIcon/Resources/icons/" "$pkgdir/usr/share/"
}
