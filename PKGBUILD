# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast"
pkgver=1.0.2
pkgrel=2
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/EasyScreenCast/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('fd9bd4bb15d326f22587398f843695bdf738abb1e7e4d8059cbf7b66b8508aef359289c1fbe3167e20f3bfbb31ac53fb3394c74a2f29d8ffbd4d338bf1cfe3da')

prepare() {
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"

    # Replace deprecated Shell.GenericContainer with St.Widget for compatibility with GNOME ≥ 3.30.
    # https://github.com/EasyScreenCast/EasyScreenCast/pull/230
    sed 's|Shell.GenericContainer|St.Widget|g' -i "selection.js"
}

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
