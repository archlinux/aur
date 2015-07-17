# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=gnome-shell-extension-coverflow-alt-tab-git
pkgver=r104.db5bd2c
pkgrel=1
pkgdesc="Alternate Alt-Tab behaviour: iterates through windows in a manner akin to Cover Flow."
arch=('any')
url="https://github.com/dmo60/CoverflowAltTab"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=gschemas.install
source=("${pkgname%-*}::git+https://github.com/dmo60/CoverflowAltTab.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  msg2 'Locating extension...'
  cd "$(dirname $(find -name 'metadata.json'))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  msg2 'Installing schemas...'
  find -name '*.xml' -exec install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" '{}' +
  msg2 'Installing localization files...'
  (
    cd locale
    for locale in */
    do
      install -Dm644 -t "$pkgdir/usr/share/locale/$locale/LC_MESSAGES" "$locale/LC_MESSAGES"/*.mo
    done
  )
}
