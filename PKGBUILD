# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=edex-ui
pkgname=${_pkgname}-bin
pkgver=2.2.7
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
sha256sums_i686=('57fc1aeb04e1f14282d23c1b682314ef038604d43ea4c8d1ef8e7f1aa126205c')
sha256sums_x86_64=('6c1f74e8d6c837e38931861fd9faf44eef83f45e357ea4901cbfb640cf85dfd2')
sha256sums_aarch64=('04621c706c3c4a4f6d399d54ad6afcc8db2c1218c79d977ad72786c1a87e900d')
b2sums=('399283bc59e70998486f2ae7b0af9f2f241206dd660e50808be3cef500adef2a9e8d449304f506d93bd2281e6b0729b16145173591deeb105ef545b769453e10')
b2sums_i686=('61f017200c9f3539ec8a7737242b5f5d3a4d0b81eff21fa862584b7f86c6546545ca5cc85499cbcf051bf3185674bd8d8baa15734a4b5d42c46a0ecc1af17254')
b2sums_x86_64=('407b411f7bc34add191709c8b54baf3a9ce6472dc362b7a998f2944362b10a21d8dfeca4ddce156f3f43793e969ed5e779066b3de3b07a1b207bf98b40b3ac7c')
b2sums_aarch64=('30d0d1d7dca9ac28259d38e312c477c9903ddc424a96d25bafe8debd7a43f63cbb21650dee73c5c44604013632f4b7c81db7c59d7b849d5236569107e45d2571')

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
