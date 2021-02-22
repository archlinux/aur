# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=edex-ui
pkgname=${_pkgname}-bin
pkgver=2.2.6
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
sha256sums_i686=('31116f735e6881685b0d0e9bd52049107de0615a2addedc63dc5155f1690664a')
sha256sums_x86_64=('82f8c9de26a80d3cca0f8f23ee2f37ef82bb1711d0647a4fb7f86011305a3b2c')
sha256sums_aarch64=('5d66a95740e5b21a07323463fd25ba4171a21186be7eefcd907cad30a2c798c4')
b2sums=('399283bc59e70998486f2ae7b0af9f2f241206dd660e50808be3cef500adef2a9e8d449304f506d93bd2281e6b0729b16145173591deeb105ef545b769453e10')
b2sums_i686=('59778b92b38b2ed048d55924cb087ca076fa7af7695547aa998fc53971430f11b838b07ce8fb745b6b71fb06282927530ee9c0686bca276da07620052119b4d5')
b2sums_x86_64=('c0ce3cfbb65a28ac9871f68b3993f8e729be1f1186eb54ac60e95986c2986ff25ab5bb321cd1453e2ff099c203a7861e681b46dbd823ab8981d005a71ebfd1ce')
b2sums_aarch64=('1cdab2e49be6e3cac6321d4b1f22ef0ebbb1e81c9564672fdf3eb5e692fb5f5724c38b8f1d7e6b96498ff0bbc8cc9e28f9f173021e2f85b3be256822e2ada698')

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
