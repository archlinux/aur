# Maintainer: Amy <me at he3als dot xyz>

_pkgname=wayvr
_appimageprefix=WayVR
_pkgowner=wayvr-org
pkgname="${_pkgname}-actions-bin"
branch=main
pkgver=43711137000
pkgrel=1
pkgdesc="Your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR, CI build)"
arch=('x86_64')
url="https://github.com/${_pkgowner}/${_pkgname}"
license=('GPL')
replaces=("wlx-overlay-s")
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
  'fontconfig'
  'freetype2'
  'dbus'
  'libpipewire'
  'alsa-lib'
  'openvr'
  'openxr'
)

zipName="${pkgname}-${CARCH}-${pkgver}.zip"
source=(
    "${zipName}::https://nightly.link/${_pkgowner}/${_pkgname}/actions/runs/${pkgver}/${_appimageprefix}-${branch}-${CARCH}.AppImage.zip"
)

sha256sums=('d0cdde77d01c3cbc3d2dfa615938a2437928dee6e804b6aac2743ec74dcd44f4 d8f8532f9fe6d86321a7362bc5a5301c7734503da097f22c252e0bb47a408604 7d26e85b8543a8c42e758ae00b35c886e727007bb37249de0f98f8aa5712f2f0 d22d6c9a5a22cc7e0df3d873f15f0d12641b75adb4dbd2d9a747e6d9f800791d')

prepare() {
  cd "${srcdir}"
  appimage="${_appimageprefix}-${CARCH}.AppImage"

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
