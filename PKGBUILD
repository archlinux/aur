# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast-git"
pkgver=0.10.r67.g9322adf
pkgrel=1
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/EasyScreenCast/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'gnome-shell-extensions-git')
install="gschemas.install"
source=("${pkgname}::git+https://github.com/EasyScreenCast/EasyScreenCast")
sha512sums=('SKIP')
_branch=master

prepare() {
  cd "${pkgname}"
  git checkout ${_branch}
}

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${pkgname}"
  # Locate the extension.
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' -or -iname '*.glade' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  cd "${srcdir}/${pkgname}/locale"
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
