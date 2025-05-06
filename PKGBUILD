pkgname=nsight-systems
pkgver=2025.3.1
_pkgver=2025.3.1.90-3582212
_pkgver_major=2025_3
pkgrel=1
pkgdesc="A system-wide performance analysis tool for CPUs and GPUs"
arch=('x86_64')
url="https://developer.nvidia.com/nsight-systems"
depends=(
  'libxcb'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'libglvnd'
  'libice'
  'libsm'
  'libssh'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxkbfile'
  'libxrandr'
  'libxrender'
  'libxshmfence'
  'libxtst'
  'nspr'
  'nss'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm')
license=('LicenseRef-NvidiaProprietary')
source=(
  "https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/${_pkgver_major}/NsightSystems-linux-public-${_pkgver}.run"
  "${pkgname}.png::https://developer.download.nvidia.com/images/nvidia-nsight-systems-icon-gbp-shaded-256.png"
  "${pkgname}.desktop"
)
sha256sums=(
  'ef01298727e61cef860ce6ddef12d94034994d57de62049c628ed5f6e5dc97c2'
  '38cd754a193f1715095837f97bee3a274831142dc19169240ed23d527dd4c815'
  '9863b4b5f09c42218bb674a4ce00ceb29d28a2eeee8b46adac48572f12aaeee3'
)

prepare() {
  sh ./NsightSystems-linux-public-${_pkgver}.run --noexec --target "${pkgname}"
  sed "s/\$pkgver/${pkgver}/g" "./${pkgname}.desktop" > "./${pkgname}-${pkgver}.desktop"
}

package() {
  cd ${srcdir}/${pkgname}
  ./install-linux.pl -noprompt -targetpath="${pkgdir}/opt/${pkgname}"

  install -dm 755 "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/bin/nsys "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/bin/nsys-ui "${pkgdir}/usr/bin"

  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/${pkgname}-${pkgver}.desktop"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname}/pkg/EULA.txt"
}
