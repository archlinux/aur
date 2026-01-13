# Maintainer: Amy <me at he3als dot xyz>

_pkgname=wlx-overlay-s
pkgname="${_pkgname}-actions-bin"
branch=main
pkgver=20954286114
pkgrel=1
pkgdesc="OpenXR desktop overlay for Wayland compositors (GitHub Actions CI build)"
arch=('x86_64')
url="https://github.com/galister/${_pkgname}"
license=('GPL')
options=('!debug')

provides=(
  "${_pkgname}"
  "${_pkgname}=git"
)

conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "${_pkgname}-git"
)

depends=(
  'glibc'
  'gcc-libs'
  'libx11'
  'libxrandr'
  'libxinerama'
  'libxkbcommon'
  'wayland'
  'libdrm'
  'vulkan-icd-loader'
  'openxr'
)

makedepends=(
  'unzip'
)

zipName="${pkgname}-${CARCH}-${pkgver}.zip"
source=(
    "${zipName}::https://nightly.link/galister/${_pkgname}/actions/runs/${pkgver}/WlxOverlay-S-${branch}-${CARCH}.AppImage.zip"
)

sha256sums=('130589e616a133dbeefc9e58bf418a33f4394d01a65e4a57548caed1e7f360fe')

prepare() {
  cd "${srcdir}"
  appimage="WlxOverlay-S-${CARCH}.AppImage"

  msg "Extracting AppImage contents..."
  chmod +x ${appimage}
  ./${appimage} --appimage-extract > /dev/null
}

package() {
  cd "${srcdir}/squashfs-root"

  # main binary
  install -Dm0755 usr/bin/${_pkgname} \
    "${pkgdir}/usr/bin/${_pkgname}"

  # .desktop file
  install -Dm0644 usr/share/applications/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # icons
  install -dm755 "${pkgdir}/usr/share/"
  cp -a \
    "${srcdir}/squashfs-root/usr/share/icons" \
    "${pkgdir}/usr/share/"
}
