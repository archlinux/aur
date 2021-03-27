# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Michael Wendland <dev at michiwend dot com>

pkgname=gnome-shell-extension-arch-update
pkgver=40
pkgrel=1
pkgdesc="Convenient indicator for Arch Linux updates in GNOME Shell."
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('GPL3')
depends=('fakeroot' 'gnome-shell>=3.18' 'pacman-contrib')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('924c3d2913a497c46330241d9f2afab59c4c9475254619bf51473a7a7af1a3e9759100a86bac8a65812e643071d383032f1fe2c41a20af44e1471c3d2c882c83')


package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  install -Dm644 prefs.xml "${_destdir}"
  find -name '*.gschema.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cd locale
  for locale in */
    do
      install -Dm644 -t "${_destdir}/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
