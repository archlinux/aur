# Maintainer: acgq <chen330021@live.com>

pkgname=utools-wayland-bin
_pkgname=uTools
pkgver=7.8.0
pkgrel=1
pkgdesc='uTools with a native Wayland global-hotkey wake-up crash workaround'
arch=('x86_64')
url='https://github.com/acgq/utools-wayland-fix'
license=('LicenseRef-uTools')
provides=("utools=${pkgver}")
conflicts=('utools' 'utools-bin')
depends=('electron22')
options=('!strip')
source=(
  "utools-${pkgver}.deb::https://open.u-tools.cn/download/utools_${pkgver}_amd64.deb"
  'patch-native.js'
  'LICENSE.uTools.html'
)
sha256sums=(
  '38fd1a7d1b558c55756e1436bd58e7d6fd46eb0271319a4af2113a6188e1857b'
  '535581aa117704314113ffba02727bde37c87322ebf3e733d8a0c1977ef4e912'
  '986625f2970528f051391a41b1ede526de70c896209fc5bf818934b88cc12cfd'
)

prepare() {
  bsdtar -xf "${srcdir}/data."*
  node "${srcdir}/patch-native.js" \
    "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/addon/linux-x64.node"
  sed -i "s#/opt/${_pkgname}/##g" "${srcdir}/usr/share/applications/utools.desktop"

  local files=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat
    libEGL.so libffmpeg.so libGLESv2.so libvk_swiftshader.so libvulkan.so.1
    resources.pak vk_swiftshader_icd.json)
  for file in "${files[@]}"; do
    ln -sf "/usr/lib/electron22/${file}" "${srcdir}/opt/${_pkgname}/${file}"
  done
}

package() {
  install -Dm755 -d "${pkgdir}/usr/bin"
  cp -Pr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}"
  ln -sf "/opt/${_pkgname}/utools" "${pkgdir}/usr/bin/utools"
  install -Dm644 "${srcdir}/usr/share/applications/utools.desktop" \
    "${pkgdir}/usr/share/applications/utools.desktop"

  local sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
  for size in "${sizes[@]}"; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/utools.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/utools.png"
  done
  install -Dm644 "${srcdir}/LICENSE.uTools.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
