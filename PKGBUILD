# Maintainer: Orateur <orateur.starving999@passinbox.com>
#
# Desktop releases use tag desktop-v$pkgver (see .github/workflows/desktop_release.yml).
# Run the "Desktop app release" workflow once so the .deb exists before publishing this PKGBUILD.
#
# .deb basename follows Tauri bundle / productName (capital O), e.g. Orateur_0.2.2_amd64.deb.

pkgname=orateur-desktop-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Orateur speech-assistant status overlay (Tauri)'
arch=('x86_64')
url='https://github.com/orateurhq/orateur'
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'alsa-lib'
  'libappindicator-gtk3'
  'hicolor-icon-theme'
)
provides=('orateur-desktop')
conflicts=('orateur-desktop')

_tag="desktop-v${pkgver}"
_deb="Orateur_${pkgver}_amd64.deb"

source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/${_tag}/${_deb}")
sha256sums_x86_64=('fd41d22cb7eed6e5d6c31d1369cb73b886d5ef89c3f53b2068f55ebc4a04983a')

prepare() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
}

package() {
  local f
  for f in "${srcdir}"/data.tar.*; do
    [[ -f "$f" ]] || continue
    bsdtar -xf "$f" -C "${pkgdir}"
    return 0
  done
  echo 'No data.tar.* inside .deb; extract failed.'
  return 1
}
