# Maintainer: Charles Mills <charles@charlesmills.dev>

pkgname=gmpublished-bin
_pkgname=gmpublished
_github_repo='charles-mills/gmpublished'
pkgver=0.2.5
_release_tag="v${pkgver}"
pkgrel=1
pkgdesc="Native Workshop publishing and addon inspection utility for Garry's Mod"
arch=('x86_64')
url="https://github.com/${_github_repo}"
license=('GPL-3.0-only' 'LicenseRef-Steamworks-SDK')

depends=(
  'alsa-lib'
  'dbus'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'vulkan-icd-loader'
  'wayland'
)
checkdepends=('desktop-file-utils')
optdepends=(
  'steam: Workshop publishing and Garry'"'"'s Mod detection; must be running and signed in'
  'vulkan-driver: hardware-accelerated rendering; falls back to the OpenGL backend without one'
  'xdg-desktop-portal: required for open/save dialogs, with a backend such as xdg-desktop-portal-gtk'
  'xdg-utils: open files and folders in the file manager'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=(
  "${_pkgname}-${pkgver}-${CARCH}-linux.zip::\
${url}/releases/download/${_release_tag}/${_pkgname}-${pkgver}-${CARCH}-linux.zip"
)
sha256sums=('b7178234f4dc5436e304f84a77fdf540d64123348f1eaf5f7ec293c7fc4376d4')

check() {
  desktop-file-validate "${srcdir}/share/applications/${_pkgname}.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}" \
    "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -Dm644 "${srcdir}/libsteam_api.so" \
    "${pkgdir}/usr/lib/${_pkgname}/libsteam_api.so"

  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/THIRD-PARTY-NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"

  install -d "${pkgdir}/usr/share"
  cp -r "${srcdir}/share/." "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share" -type f -exec chmod 644 {} +
}
