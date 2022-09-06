# Maintainer: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

pkgname="gnome-shell-extension-easyscreencast-git"
pkgver=1.7.0.r0.g04a9dfa
pkgrel=1
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/EasyScreenCast/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'gnome-shell-extensions-git')
source=("${pkgname%-*}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' -or -iname '*.glade*' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
