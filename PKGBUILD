# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_uuid="clipboard-history@alexsaveau.dev"
_gitn=gnome-clipboard-history
_gitv=1.5.1-49
pkgname=gnome-shell-extension-clipboard-history
pkgver=44
pkgrel=4
pkgdesc="Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=("any")
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
license=("MIT")
depends=("dconf" "gnome-shell>=46.0")
conflicts=("gnome-shell-extension-clipboard-indicator")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_gitv}.tar.gz")
sha256sums=('173cbfd77fc3abc6dba088a7ef7e0d43ecec0651175775b51abc6ed76519b4eb')

build() {
  cd "${_gitn}-${_gitv}"
  make update-pot update-po-files && make all
}

package() {
  cd "${_gitn}-${_gitv}"

  install -Dm644 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" metadata.json *.js *.css
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  cd locale

  for locale in */; do
    install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo || true
  done

  sed -i '9s/46/48/' "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
}
