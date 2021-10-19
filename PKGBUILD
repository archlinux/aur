# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=edex-ui
pkgname=${_pkgname}-bin
pkgver=2.2.8
pkgrel=1
pkgdesc='A cross-platform, customizable science fiction terminal emulator with advanced monitoring & touchscreen support'
url='https://github.com/GitSquared/edex-ui'
license=('GPL3')
arch=('i686' 'x86_64' 'aarch64')
depends=('gtk3' 'libxss' 'nss')
provides=('edex-ui')
conflicts=('edex-ui')

source=("LICENSE::https://raw.githubusercontent.com/GitSquared/edex-ui/v${pkgver}/LICENSE")
source_i686=("${pkgname}-${pkgver}.i686.AppImage::https://github.com/GitSquared/edex-ui/releases/download/v${pkgver}/eDEX-UI-Linux-i386.AppImage")
source_x86_64=("${pkgname}-${pkgver}.x86_64.AppImage::https://github.com/GitSquared/edex-ui/releases/download/v${pkgver}/eDEX-UI-Linux-x86_64.AppImage")
source_aarch64=("${pkgname}-${pkgver}.aarch64.AppImage::https://github.com/GitSquared/edex-ui/releases/download/v${pkgver}/eDEX-UI-Linux-arm64.AppImage")

noextract=("${pkgname}-${pkgver}.${CARCH}.AppImage")
options=(!strip)

sha256sums=('c61f12da7cdad526bdcbed47a4c0a603e60dbbfdaf8b66933cd088e9132c303f')
sha256sums_i686=('21ab08e0fcdb0bb4d48412d0676d91f5b43fa07e91ad74ad1f1bfcd909a77653')
sha256sums_x86_64=('c8f28cd721ca032ca0c1960b756ca3e64dc441a643c32eafbb79c673b402d681')
sha256sums_aarch64=('1afe0146c312dc9fde1c569ed370cbcdc82ba4282ae372a7921cd6dfc9462236')
b2sums=('6b24a59db277c102dc2bcc1d19b16c440b03d879585a586c3eb3945bb7121db0d9226e9a1b3b952d09bf4b2dc990d9e3c8e7536d06f6e73ac8cf5cbc69310bd7')
b2sums_i686=('d5530dda9e22c801edbb7c545cf73fe7803b174096a64c9f73f02c6cd17bfbbac41482c584588e70557c259df34f4b685fe2acd6ebce94968727f2d0346481cc')
b2sums_x86_64=('2df865517b666522a3d1000a1e75812462307d08d1bd09e5213e9d65adf4614fb2145f61f4ee1c9801f1ba63802ba698585c4392f3f7faad0704985099a916fd')
b2sums_aarch64=('617f5563145e65985443a73110975739456750628bec51a37e621e6b25a7d1833fa12c84ffdabf9757733a2c682b09c0242fe133927aa2ecfb0717e48dd33643')

prepare() {
  chmod +x "${pkgname}-${pkgver}.${CARCH}.AppImage"
  "./${pkgname}-${pkgver}.${CARCH}.AppImage" --appimage-extract
}

build() {
  sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
}

package() {
  # Copy app files
  install -dm0755 "${pkgdir}/opt/${_pkgname}"
  cp -a squashfs-root/* "${pkgdir}/opt/${_pkgname}"

  # Remove unused files
  rm -rf "${pkgdir}/opt/${_pkgname}"/{usr,swiftshader,AppRun,${_pkgname}.{desktop,png}}

  # Fix permissions
  for d in locales resources; do
    chmod 0755 "${pkgdir}/opt/${_pkgname}/$d"
    find "${pkgdir}/opt/${_pkgname}/$d" -type d -exec chmod 0755 {} +
  done

  # Link entry point
  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Copy icons files
  install -dm0755 "${pkgdir}/usr/share/icons"
  find squashfs-root/usr/share/icons -type d -exec chmod 0755 {} +
  cp -a squashfs-root/usr/share/icons/* "${pkgdir}/usr/share/icons"

  # Copy desktop file
  install -Dm0644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install LICENSE file
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
