# Maintainer: Arthur Aslanyan <arthur.e.aslanyan@gmail.com>
_name=anytype

pkgname="${_name}-appimage"
pkgver=0.48.5
pkgrel=1
pkgdesc="Local‑first, peer‑to‑peer & end‑to‑end‑encrypted knowledge OS for macOS, Windows & Linux."
arch=('x86_64')
url='https://anytype.io/'
license=('custom')
depends=('zlib' 'bash' 'patch')
provides=("${_name}=${pkgver}")
conflicts=("${_name}-bin")
options=(!strip)
source=("${pkgname}-${pkgver}::https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}/Anytype-${pkgver}.AppImage"
  "${_name}.desktop.patch"
  "${_name}.sh"
  "LICENSE")
sha256sums=('4b67f6e87265100f3fab7adf82bca2548acca5079d3f890bd29e4ac3ba851acd'
  '91ed4a213f987471b1f299281328654757390fc6878786d6224edfc1951351f1'
  '7570409951e010280a3509bf4f4349049d6bf3fe03c7322a893902ecc3d57aaf'
  'f334fbac4188a7f37fcfcb0c683ac312f1d98f26233b6b4aba0277b341af105a')

prepare() {
  cd "${srcdir}"
  chmod +x "${pkgname}-${pkgver}"
  "./${pkgname}-${pkgver}" --appimage-extract
  patch -Np0 <"./${_name}.desktop.patch"
}

package() {
  # Install AppImage and bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/appimages/${_name}.AppImage"
  install -Dm755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"

  # Install icon and desktop
  install -Dm644 "${srcdir}/squashfs-root/${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"
  install -Dm644 "${srcdir}/squashfs-root/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
