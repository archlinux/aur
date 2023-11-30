# Maintainer: Jose Riha <jose 1711 gmail com>
# vim:set ts=2 sw=2 et:

pkgname=duckypad-profile-autoswitcher-git
_pkgname=duckyPad-profile-autoswitcher
_sname=duckyPad-autoswitcher
pkgver=r76.7beb498
pkgrel=1
pkgdesc="App allowing duckyPad to switch profiles automatically based on active window (git)"
arch=('any')
url="https://github.com/dekuNukem/duckyPad-profile-autoswitcher"
license=('MIT')
provides=('duckypad-profile-autoswitcher')
conflicts=('duckypad-profile-autoswitcher')
depends=('duckypad' 'python-ewmh' 'python-psutil')
makedepends=('git' 'imagemagick' 'gendesk')
source=("$pkgname"::"git+https://github.com/dekuNukem/${_pkgname}" duckypad_autoswitcher.sh)
sha256sums=('SKIP'
            '58869235e7be8d049900285985d11775988150c950cd705715caf393e53463f7')

prepare() {
  cd "${srcdir}/${pkgname}"
  convert 'src/icon.ico[0]' ${_sname}.png
  gendesk -f -n --pkgname "duckyPad autoswitcher" --pkgdesc "${pkgdesc}" --exec "${_sname}" \
                --categories "Utility;Accessibility" --icon "${_sname}"
}
          
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  for i in check_update duckypad_autoprofile get_window hid_rw
  do
    install -Dm755 src/$i.py "${pkgdir}/usr/share/duckypad_autoswitcher/$i.py"
  done
  install -Dm755 "${srcdir}/duckypad_autoswitcher.sh" "${pkgdir}/usr/bin/${_sname}"

  install -Dm644 "duckyPad autoswitcher.desktop" "${pkgdir}/usr/share/applications/duckyPad autoswitcher.desktop"
  install -Dm644 "${_sname}.png" "${pkgdir}/usr/share/pixmaps/${_sname}.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for i in *.md
  do
    install -Dm644 "$i" "${pkgdir}/usr/share/doc/${pkgname}/$i"
  done
}
