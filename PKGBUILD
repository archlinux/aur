# Maintainer:  dreieck
# Contributor: Plague-doctor <plague at privacyrequired dot com >

_pkgbase="mullvad-tray"
_pkgname="${_pkgbase}"
pkgname="${_pkgname}-git"
pkgver=0.3+3.r30.20241125.3fb9618
pkgrel=4
pkgdesc="Mullvad VPN connection status in system tray. Latest git checkout.."
arch=('any')
depends=(
  'python>=3'
  'python-pyqt5'
  'python-requests'
)
makedepends=(
  "git"
  "zopflipng-parallel"
)
url="https://gitlab.com/Plague_Doctor/mullvad-tray"
license=('GPL-3.0-or-later')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > git.log
}

pkgver () {
  cd "${srcdir}/${_pkgbase}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgbase}/images"

  zopflipng-parallel -m -- *.png
}

package() {
  cd "${srcdir}/${_pkgbase}"

  install -Dvm755 -t "${pkgdir}/opt/${_pkgbase}"  mullvad-tray.py
  install -Dvm644 -t "${pkgdir}/opt/${_pkgbase}"  mullvad-tray.ui
  install -Dvm644 -t "${pkgdir}/opt/${_pkgbase}/images"  images/*

  install -dvm755 "${pkgdir}/usr/bin"
  ln -sv "/opt/${_pkgbase}/mullvad-tray.py"  "${pkgdir}/usr/bin/mullvad-tray"

  install -Dvm644 "mullvad-tray.desktop"         "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dvm644 "images/mullvad-tray-logo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"      git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
