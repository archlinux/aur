# Maintainer: Hasan C
pkgname=gw2taco-bin
pkgver=067.3705r
pkgrel=2
pkgdesc="Guild Wars 2 Tactical Overlay (GW2TacO) - upstream Windows binary (runs via Wine)"
arch=('any')
url="https://github.com/BoyC/GW2TacO"
license=('LicenseRef-GW2TacO')
depends=('wine')
makedepends=('libarchive')
options=(!strip)
optdepends=(
  'winetricks: optional helper for managing Wine prefixes (not required)'
)
provides=('gw2taco')
conflicts=('gw2taco')

_major="${pkgver%%.*}"

source=(
  "${pkgname}-${pkgver}.zip::https://github.com/BoyC/GW2TacO/releases/download/${pkgver}/GW2TacO_${_major}r.zip"
  "gw2taco"
  "gw2taco.desktop"
  "vcredist_x64.exe::https://aka.ms/vs/17/release/vc_redist.x64.exe"
  "vcredist_x86.exe::https://aka.ms/vs/17/release/vc_redist.x86.exe"
)

sha256sums=('8930e4e62a2d5eb91c66c091b1019bc25931707236edefb9af8f5730131b35e3'
            'fa79978ad24d3bb4c2a6ed1d5750d47f00226183811c4f747c63f61c8674a380'
            '517d3dd9b94e9e1613e8a92544abf320691c19c675a2845c32009049ebed6f7b'
            'cc0ff0eb1dc3f5188ae6300faef32bf5beeba4bdd6e8e445a9184072096b713b'
            '0c09f2611660441084ce0df425c51c11e147e6447963c3690f97e0b25c55ed64')

package() {
  install -d "${pkgdir}/opt/gw2taco"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" -C "${pkgdir}/opt/gw2taco"
  printf '%s-%s\n' "$pkgver" "$pkgrel" > "${pkgdir}/opt/gw2taco/.gw2taco-package-stamp"

  install -Dm755 "${srcdir}/gw2taco" "${pkgdir}/usr/bin/gw2taco"
  install -Dm644 "${srcdir}/gw2taco.desktop" "${pkgdir}/usr/share/applications/gw2taco.desktop"

  install -d "${pkgdir}/usr/share/${pkgname}/redist"
  install -m644 "${srcdir}/vcredist_x64.exe" "${pkgdir}/usr/share/${pkgname}/redist/vcredist_x64.exe"
  install -m644 "${srcdir}/vcredist_x86.exe" "${pkgdir}/usr/share/${pkgname}/redist/vcredist_x86.exe"

  if [[ -f "${pkgdir}/opt/gw2taco/LICENSE" ]]; then
    install -Dm644 "${pkgdir}/opt/gw2taco/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
