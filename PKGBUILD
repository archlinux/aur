# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=duckypad-git
_pkgname=duckyPad-Configurator
pkgver=4.0.0.r62.ge8d5d58
pkgrel=1
pkgdesc="duckyPad configurator (git)"
arch=('any')
url="https://github.com/duckyPad/duckyPad-Configurator"
license=('MIT')
provides=('duckypad')
install=duckypad.install
conflicts=('duckypad')
depends=('python' 'python-hidapi' 'python-platformdirs' 'python-psutil' 'python-requests' 'python-certifi' 'python-darkdetect' 'tk' 'duckypad-udev')
makedepends=('git' 'imagemagick' 'gendesk')
source=("git+https://github.com/duckyPad/${_pkgname}.git" "duckypad_config.sh")
sha256sums=('SKIP'
            '922d72e28044cf0f524d8e56ecaf9b205a5f29df5ada41071f8a3b1425406bc3')

prepare() {
  cd "${srcdir}/${_pkgname}"
  magick src/_icon.ico duckyPad.png
  gendesk -f -n --pkgname "duckyPad" --pkgdesc "${pkgdesc}" --exec "duckypad_config" --categories "Utility;Accessibility"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  for i in src/*.py
  do
    case "$(basename "$i")" in
      _*) continue ;;
    esac
    install -Dm644 "$i" "${pkgdir}/usr/share/duckypad/$(basename "$i")"
  done
  install -Dm755 "${srcdir}/duckypad_config.sh" "${pkgdir}/usr/bin/duckypad_config"

  install -Dm644 "duckyPad.desktop" "${pkgdir}/usr/share/applications/duckyPad.desktop"
  install -Dm644 "duckyPad.png" "${pkgdir}/usr/share/pixmaps/duckyPad.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
