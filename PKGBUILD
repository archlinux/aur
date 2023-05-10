# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_depends="wxwidgets-common"
pkgname="wxwidgets-old-include-dir-shim"
pkgver=3.2.2.1
pkgrel=1
pkgdesc="Makes '/usr/include/wx-<WxVersion>/wx/' available as '/usr/include/wx/', as some old software expects."
arch=(
  'any'
)

url="https://wxwidgets.org"
license=("custom: Public Domain.")
depends=(
  "${_depends}"
)
makedepends=()
checkdepends=()
provides=(
  "wxwidgets-old-include-dir=${pkgver}"
)
conflicts=(
  "wxwidgets-old-include-dir"
)
replaces=()

source=(
  'license-metapackage-pd.txt'
)
sha256sums=(
  'af68dd29515606a94237214e4c33b0e3f4f2408ed92df3674a043bf2fa2c0078'
)
pkgver() {
  pacman -Q "${_depends}" | cut -d ' ' -f 2 | sed -E 's|-.*||'
}

package() {
  _wxver="$(awk -F. '{print $1"."$2}' <<<"${pkgver}")"
  install -d -v -m755 "${pkgdir}/usr/include"
  install -d -v -m755 "${pkgdir}/usr/include/wx-${_wxver}/wx"
  cd "${pkgdir}/usr/include"
  ln -sv  "wx-${_wxver}/wx" "wx"
  ln -svr "wx-${_wxver}/wx/setup_redirect.h" "wx-${_wxver}/wx/setup.h"

  install -D -v -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.public-domain.txt"
}
