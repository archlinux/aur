# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>

_pkgname=wayvr
pkgname="${_pkgname}-bin"
pkgver=26.1.0
pkgrel=1
pkgdesc="OpenXR desktop overlay for Wayland compositors (binary release)"
arch=('x86_64')
url="https://github.com/wlx-team/${_pkgname}"
license=('GPL')
options=('!debug')

provides=(
  "${_pkgname}"
)

conflicts=(
  "${_pkgname}"
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

source=(
    "https://github.com/wlx-team/${_pkgname}/releases/download/v${pkgver}/WayVR-v${pkgver}-${CARCH}.AppImage"
)

sha256sums=('f8e2153f0c939847e44609d4fdb5b56803f49df92495de438f237a4e3c15c5ac')

prepare() {
  cd "${srcdir}"
  appimage="WayVR-v${pkgver}-${CARCH}.AppImage"

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
