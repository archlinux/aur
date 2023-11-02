pkgname=gnome-shell-extension-app-icons-taskbar
_pkgbase=aztaskbar
pkgver=21
pkgrel=1
pkgdesc="A simple app icon taskbar extension for GNOME"
arch=('any')
url="https://gitlab.com/AndrewZaech/aztaskbar"
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:41')
source=("${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
sha256sums=('0ab28797bbb09602500dbcd41029ab443d9157ae60eb50555d283180ad38fa8a')

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
