# Maintainer: Amy <me at he3als dot xyz>

_pkgname=wayvr
_appimageprefix=WayVR
_pkgowner=wayvr-org
pkgname="${_pkgname}-actions-bin"
branch=main
pkgver=42038525918
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

sha256sums=('79b1de480e56df81b9ea4697d1e339fd3bf8e1800c42d26aded2701d1739aca6 51976163c500dc666d70de050b558bc4ede11d4602cf03cb0b3afb52192e5d00 8b3c0a56a54e67492a8a36b9bf05ca5c45ec79bead093e16aac57ad2ac6279a8 cf848c5364798a94af261c0b667886050a11ff68ef3811b0fede567cec03386f')

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
