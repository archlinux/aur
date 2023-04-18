# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-vitals
pkgver=61.0.0
pkgrel=1
pkgdesc="Displays system vitals in a GNOME Shell top bar pop-down."
arch=('any')
url="https://github.com/corecoding/Vitals"
license=('GPL')
depends=('dconf' 'gnome-icon-theme' 'gnome-icon-theme-symbolic' 'gnome-shell' 'libgtop' 'lm_sensors')
makedepends=('gettext' 'git')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"/locale
  for locale in */
    do
      msgfmt -o "${locale}/LC_MESSAGES"/vitals.mo "${locale}/LC_MESSAGES"/vitals.po
    done
}

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json) 
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cp -r --no-preserve=ownership,mode helpers "${_destdir}"
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
