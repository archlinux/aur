# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast"
pkgver=0.9.8.4
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
sha512sums=('d931311f9e01cce679a8186dd01820231f34dbad7de16a5c970ed5a9efc84a5662652db7602c15542e9a7a7e8e25e976d171d74a136cf918b6f774200b7f1e99')

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
