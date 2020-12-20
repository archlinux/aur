# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=edex-ui
pkgname=${_pkgname}-bin
pkgver=2.2.4
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
sha256sums_i686=('b62e3eab19e9a3e2c875cdadd2399aecaf4164746d6eb1e123acfcd56d11b856')
sha256sums_x86_64=('8497ce2c8ffedf20964ac124755a45dded38dbd99f7411dcc2a4d4b318c956b4')
sha256sums_aarch64=('53a902ead383dacb67a7552a785d1cff27953fd5a56a47b611001abbe53268e0')
b2sums=('399283bc59e70998486f2ae7b0af9f2f241206dd660e50808be3cef500adef2a9e8d449304f506d93bd2281e6b0729b16145173591deeb105ef545b769453e10')
b2sums_i686=('439d3d469793bc4e1d010f7569ee2e062fd3ddc848eff631025be09197629e392790f8ea98ea098cdbf587c2036d7ba5d7ff412ee5ae700f8ebb20d89fcab6b0')
b2sums_x86_64=('500a01dd85d3e77280922e29a1beeb143dac08a8582317200afd63a17a9bed3165ca2d01d3c3c40783f0a7628d50d77477e18be6ce02ff948ad9f112693af4e3')
b2sums_aarch64=('f745f5bad31fabfdcc9ea1a798f4260ddb9768089081ff82e42b9e6f9f690c0ef22b04fbbe73889e870f715200259d0b584c3fb06e46caab9b2e569f2adf843e')

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
