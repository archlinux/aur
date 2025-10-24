# Maintainer: Matthieu Leboeuf <contact at matthieul dot dev>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-app-icons-taskbar
_pkgbase=aztaskbar
pkgver=31.01
pkgrel=1
pkgdesc="A simple app icon taskbar. Show running apps and favorites on the main panel."
arch=('any')
url="https://gitlab.com/AndrewZaech/aztaskbar"
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:45')
source=("${url}/-/archive/v${pkgver}/${_pkgbase}-v${pkgver}.tar.gz")
b2sums=('7b5ca46f8f7617f2cfe220107628c9094efeb09636bda46cd306c8e7c8e975be96c3e2d74d626d38ff5a470e32f090b12a8502f3ed4b1fc935379e42c7e8a695')

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
