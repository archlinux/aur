# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=frameport-bin
_pkgname=frameport
pkgver=1.3.0
pkgrel=1
pkgdesc="Port games and apps to work with the Valve Steam Frame"
arch=('x86_64' 'aarch64')
url="https://github.com/spoopyghosty0/frameport"
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libepoxy'
  'libpng'
  'zlib'
)
optdepends=(
  'mpv: live view player for Linux'
)
provides=('frameport')
conflicts=('frameport')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/spoopyghosty0/frameport/releases/download/v${pkgver}/FramePort-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/spoopyghosty0/frameport/releases/download/v${pkgver}/FramePort-linux-arm64.tar.gz")
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/spoopyghosty0/frameport/v${pkgver}/LICENSE"
  "THIRD_PARTY_NOTICES-${pkgver}.md::https://raw.githubusercontent.com/spoopyghosty0/frameport/v${pkgver}/THIRD_PARTY_NOTICES.md"
)

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '7ff2de3077a117e1afa4dba1e52f0a07fec3e2952ee0fce57619291ca2d2a8c1')
sha256sums_x86_64=('4b1eaa0165533163a09efcba6326b8a0796effaa77cae49279365559ef8feff9')
sha256sums_aarch64=('9cc39a55181fe76ba896e0b39f421391bd5922e97cff0c95c66ddcc426e82682')

package() {
  local _installdir="${pkgdir}/opt/${_pkgname}"
  install -dm755 "${_installdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"

  cp -a "${srcdir}/FramePort/"* "${_installdir}/"

  # Executable symlink
  ln -s "/opt/${_pkgname}/FramePort" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/FramePort/share/applications/dev.frameport.frameport.desktop" \
    "${pkgdir}/usr/share/applications/dev.frameport.frameport.desktop"
  sed -i 's|^Exec=.*|Exec=/opt/frameport/FramePort %U|' \
    "${pkgdir}/usr/share/applications/dev.frameport.frameport.desktop"

  # Icons
  cp -a "${srcdir}/FramePort/share/icons/"* "${pkgdir}/usr/share/icons/"
  rm -f "${pkgdir}"/usr/share/icons/hicolor/*/apps/None.png

  # Licenses
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES-${pkgver}.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
