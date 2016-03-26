# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast"
pkgver=0.9.8.1
pkgrel=1
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/iacopodeenosee/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
provides=("${pkgname}")
conflicts=("${pkgname}-git" 'gnome-shell-extensions-git')
install="gschemas.install"
source=("${pkgname}::https://github.com/iacopodeenosee/EasyScreenCast/archive/${pkgver}.tar.gz")
sha512sums=('b456a10a56f8e2481670665a11fcc54f2d494e105e85e710acbe8cad71f21236f2725638d42db2d07262961adb3fd57bdd228fc706a2f74f66969415674a992e')

package() {
  cd "${srcdir}/EasyScreenCast-${pkgver}"
  # Locate the extension.
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  cd "${srcdir}/EasyScreenCast-${pkgver}/locale"
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
