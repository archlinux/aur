# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-volume-mixer"
pkgver=0.9.1
pkgrel=1
pkgdesc="Enable configuration of individual PulseAudio mixers from GNOME Shell's status menu."
arch=('any')
url="https://github.com/aleho/gnome-shell-volume-mixer"
license=('GPL2')
depends=('gnome-shell' 'python')
provides=("${pkgname}")
conflicts=("${pkgname}")
install=gschemas.install
source=("${pkgname}::https://github.com/aleho/gnome-shell-volume-mixer/archive/v0.9.1.tar.gz")
sha512sums=('169f1504e3f9b74c6b3a362ecb75f69b66a58c96a1b355cd5fc8f8ae4dea7601fb7f585884f8fd62f77809a24e70c1bd5701fd7bf3c9e63703d17395bda97925')

package() {
  cd "${srcdir}/gnome-shell-volume-mixer-${pkgver}"
  msg2 'Locating extension...'
  cd "$(dirname $(find -name 'metadata.json'))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  cp -r --no-preserve=ownership pautils "${_destdir}"
  msg2 'Installing schemas...'
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  msg2 'Installing localization files...'
  (
    cd locale
    for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
  )
}
