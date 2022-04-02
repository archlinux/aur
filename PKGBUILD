# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-app-icons-taskbar
_pkgbase=aztaskbar
pkgver=4
pkgrel=1
pkgdesc="A simple app icon taskbar extension for GNOME"
arch=('any')
url="https://gitlab.com/AndrewZaech/aztaskbar"
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:41')
conflicts=('gnome-shell-extension-app-icons-taskbar-git')
source=("https://gitlab.com/AndrewZaech/${_pkgbase}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('1515394acb71fdf949593295e27308b03281284296acafd58b5188e2bca87cd0')

build() {
  cd "${_pkgbase}-v${pkgver}"
  make DESTDIR="${srcdir}/" VERSION="${pkgver}" install
  cd .. && rm -rf "${_pkgbase}-v${pkgver}"
}

package() {
  # Locate compiled extention.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  # Install extension files
  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  cp -r --no-preserve=ownership,mode media "${_destdir}"
  
  # Install GSettings Schema & Locale
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
