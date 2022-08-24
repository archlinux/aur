# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-clipboard-history
_pkgbase=gnome-clipboard-history
pkgver=18
_gitver=1.2.3
pkgrel=1
epoch=1
pkgdesc="Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=(any)
url='https://github.com/SUPERCILEX/gnome-clipboard-history'
license=('MIT')
depends=('dconf' 'gnome-shell')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_gitver}.tar.gz")
sha256sums=('fccc1898ab9fc12667cc0af3e2697631c01fbc43abdf9678179870debeade845')

build() {
  cd "${_pkgbase}-${_gitver}"
  make update-pot update-po-files \
    && make all
}

package() {
  cd "${_pkgbase}-${_gitver}"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
