# Maintainer: Amy <me at he3als dot xyz>

_pkgname=wayvr
_appimageprefix=WayVR
_pkgowner=wlx-team
pkgname="${_pkgname}-actions-bin"
branch=main
pkgver=21099427436
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

sha256sums=('676413fb7e1038e3400f6bf867a0153f842ddf43e7c1526555a554f7f0299d1a')

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
