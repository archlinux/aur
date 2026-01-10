# Maintainer: Amy <me at he3als dot xyz>

_pkgname=wlx-overlay-s
pkgname="${_pkgname}-actions-bin"
branch=main
pkgver=20884106569
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

sha256sums=('95060261a9646c3eebfa37e2fad381200616075cf903cd78b4cd9951a2bcb73d')

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
