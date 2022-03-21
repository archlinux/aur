# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-clipboard-history
pkgver=1.1.1
pkgrel=3
epoch=1
pkgdesc="Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=(any)
url='https://github.com/SUPERCILEX/gnome-clipboard-history'
license=('MIT')
depends=('dconf' 'gnome-shell>=40')
source=("https://github.com/SUPERCILEX/gnome-clipboard-history/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('edddccb5bf043c176f247e44255b1b68d9f13e775b30d0ef6073cc85b1df3067')

build() {
  cd "gnome-clipboard-history-${pkgver}"
  make
}

package() {
  cd "gnome-clipboard-history-${pkgver}"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  # Install extension files
  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  # Install GSettings Schemas & Locale
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
