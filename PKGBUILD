# Maintainer: Amy <me at he3als dot xyz>

_pkgname=wayvr
_appimageprefix=WayVR
_pkgowner=wayvr-org
pkgname="${_pkgname}-actions-bin"
branch=main
pkgver=43732563424
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

sha256sums=('1ff08dab4aa242a5b1d3bbd3029e33a9740ec06818635568f15e2fc54fca9dbe 499f4721dad4a673c1d255a808d224576dbdcf6975b9d25b780bcd08f6fe2bcd 79e69486fb528d2cdb55618c4fddc5a2b032d937ea36fbdaee77b136c962c383 6087a4c17c633bef1632d5a3b277986ae084285301572171cc82a025148b0695')

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
