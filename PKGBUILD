# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=duckypad-git
_pkgname=duckyPad
pkgver=r997.5ce12a12
pkgrel=1
pkgdesc="duckyPad configurator (git)"
arch=('any')
url="https://github.com/dekuNukem/duckyPad"
license=('MIT')
provides=('duckypad')
install=duckypad.install
conflicts=('duckypad')
depends=('python-hidapi' 'python-appdirs' 'python-pyautogui' 'tk' 'duckypad-udev')
makedepends=('git' 'imagemagick' 'gendesk')
source=("$pkgname"::"git+https://github.com/dekuNukem/${_pkgname}" "duckypad_config.sh" "duckypad.rules")
sha256sums=('SKIP'
            '922d72e28044cf0f524d8e56ecaf9b205a5f29df5ada41071f8a3b1425406bc3'
            '4ef8c49f2842f7a5ede9a6644be2a710bfcb43f074119c0c2abc29926169b06d')

prepare() {
  cd "${srcdir}/${pkgname}"
  convert pc_software/_icon.ico duckyPad.png
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec "duckypad_config" --categories "Utility;Accessibility"
}
          
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  for i in pc_software/*.py
  do
    install -Dm755 $i "${pkgdir}/usr/share/duckypad/$(basename $i)"
  done
  install -Dm755 "${srcdir}/duckypad_config.sh" "${pkgdir}/usr/bin/duckypad_config"

  install -Dm644 "duckyPad.desktop" "${pkgdir}/usr/share/applications/duckyPad.desktop"
  install -Dm644 "duckyPad.png" "${pkgdir}/usr/share/pixmaps/duckyPad.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for i in *.md
  do
    install -Dm644 "$i" "${pkgdir}/usr/share/doc/${pkgname}/$i"
  done
}

# vim:set ts=2 sw=2 et:
