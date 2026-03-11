# Maintainer: Matthieu Leboeuf <contact at matthieul dot dev>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-app-icons-taskbar
_pkgbase=aztaskbar
pkgver=31.2
pkgrel=1
pkgdesc="A simple app icon taskbar. Show running apps and favorites on the main panel."
arch=('any')
url="https://gitlab.com/AndrewZaech/aztaskbar"
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:45')
source=("${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
b2sums=('f3f60dc242a7f3622dbd0042a8ff220d46331b8533573b2c21af19c3578ebbf960b8f904c5b2ce06679725a5cf3a16fb626b8ab785eae8f5c189c0ed35be83b3')

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
  cp -r --no-preserve=ownership,mode settings "${_destdir}"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
