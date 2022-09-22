# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-app-icons-taskbar
_pkgbase=aztaskbar
pkgver=11
pkgrel=1
pkgdesc="A simple app icon taskbar extension for GNOME"
arch=('any')
url="https://gitlab.com/AndrewZaech/aztaskbar"
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:41')
conflicts=('gnome-shell-extension-app-icons-taskbar-git')
source=("${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('5a44a9e85d3019574fc65ac08e652641c72c5f6ad967fcc36cb264726657f91c')

build() {
  cd "${_pkgbase}-v${pkgver}"
  make mergepo \
    && make VERSION="${pkgver}" _build
}

package() {
  cd "${_pkgbase}-v${pkgver}/_build"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  cp -r --no-preserve=ownership,mode media "${_destdir}"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
