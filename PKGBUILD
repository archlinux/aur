# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=edex-ui
pkgname=${_pkgname}-bin
pkgver=2.2.3
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

sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
sha256sums_i686=('b4f7a11c9d9a223a25aa92b08a23a3c3a9f895e30b91d97e6f85f50ff103342c')
sha256sums_x86_64=('1c2044d7f9aae8696747110138968940989530ac70716a2aca421f43e7ea6fab')
sha256sums_aarch64=('eef5713f03cc704f4d74e7a6559837e4771dd3a1f5217701bcfc7a2952800742')
b2sums=('399283bc59e70998486f2ae7b0af9f2f241206dd660e50808be3cef500adef2a9e8d449304f506d93bd2281e6b0729b16145173591deeb105ef545b769453e10')
b2sums_i686=('01d7ff84ac977e93316bb351b617de6a639f06cd8abb357408cd90a8cb09866139d4503c92f373017bd5eb50a3680a2a8d4683921956441066289b0a94b10b1b')
b2sums_x86_64=('acd6b3b3350d47461c813520f08d008c13bdb044e1374e02878c9b3f8f2c2e3e5245f44703911fdb6c91315d3098c42f8dc8334534a4473454f63c73e20c0fc4')
b2sums_aarch64=('bb486e160a8dc914cfc9ee346314b8675bfa4be0c5aa6b39b6aa079a0098dfe0c2dc342deab751f621b4d609e5879bcd8bf879d9788b967f2df58b6ca5bb0a46')

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
    chmod 0755 squashfs-root/$d
    find squashfs-root/$d -type d -exec chmod 0755 {} +
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
