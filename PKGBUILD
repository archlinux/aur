# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=duxlabs-dev
_repo=dux-files
_binname=dfiles
_appid=dev.duxlabs.files
_portalservice=org.freedesktop.impl.portal.desktop.dfiles.service

pkgname=dux-files-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="File manager for Wayland from Dux Labs (prebuilt binary)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
_urlrel="${url}/releases/download/v${pkgver}"
license=('MIT')
depends=('quickshell' 'qt6-declarative')
optdepends=('dms-shell: dynamic theming via Dux Shell colors'
            'bubblewrap: run external thumbnailers in a sandbox'
            'ffmpegthumbnailer: video thumbnails'
            'poppler: pdf thumbnails'
            'gvfs: network shares and the trash on removable drives'
            'udisks2: the devices sidebar'
            'polkit: retry denied operations as administrator'
            'xdg-desktop-portal: use dfiles as the file chooser')
provides=("${_binname}" "${_repo}")
conflicts=("${_binname}" "${_repo}" 'dux-files-git')

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "${_appid}-${pkgver}.desktop::${_urlraw}/assets/${_appid}.desktop"
  "${_appid}-${pkgver}.metainfo.xml::${_urlraw}/assets/${_appid}.metainfo.xml"
  "${_appid}-${pkgver}.policy::${_urlraw}/assets/${_appid}.policy"
  "${_appid}.FileManager1-${pkgver}.service::${_urlraw}/assets/dbus/${_appid}.FileManager1.service"
  "${_portalservice%.service}-${pkgver}.service::${_urlraw}/assets/dbus/${_portalservice}"
  "${_binname}-${pkgver}.portal::${_urlraw}/assets/portal/${_binname}.portal"
  "${_binname}-${pkgver}.service::${_urlraw}/assets/systemd/${_binname}.service"
  "${_appid}-${pkgver}.svg::${_urlrel}/${_appid}.svg"
  "${_binname}-completions-${pkgver}.tar.gz::${_urlrel}/${_binname}-completions-${pkgver}.tar.gz"
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${_urlrel}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('0c4c01a73eb7d2d1286a7e60e580dd53b605636dc46a57c9c3318e8e23efc676'
            '6c26c302053ca9ce08609648b927d03345eb524ab60989699be2fdf0768640aa'
            '0f230c913a248cbac737341ef5ee0a9e6ccfdda08b459ca14b5af99dd49f773d'
            '3fca7d27b64bd0c81e93868f4c3c5ac3ef71790c95b58608890e9c022be62ed0'
            '52fa30b44fefa5a632996075e370923c83b911cd198ffcff959a79789d1e5e17'
            'b34bfc6ff30a69ed6bb465afd3acfcdb141c5801d29595b6b24558649d331268'
            'edafb25bfd85273bc28e9761dd06b43c61a2d5a6d6dab725766a2b0c6c717bca'
            '1cf796976f0381a7967dd8785ef326414d6b62eb0fde1ff3691e06a744577669'
            '705b8b9636c11c3ef62acffea7870000b92481df6dd73d6b1ffa4ae3d54863c6'
            'a01be1c1c3780f8ea3ff3df530374c23088fd78265e070fdf93e5d41ee53fd69'
            '5b2967b3a2f06ffaa6a855b7e11386616208750e6529a8314ce46e5808f280c1')
sha256sums_x86_64=('6d6b421cf62ae4ecd96eedc89e6f357d938d6d0632d096618ce049c394805b19')
sha256sums_aarch64=('5d5bec4cf21b5c8e9e745824de9a36bda90bf8107351d3d7b9845189617dc04d')

# makepkg's mime sniffing does not reliably detect a gzipped ELF, so decompress it ourselves
noextract=("${_binname}-${arch[0]}-${pkgver}.gz" "${_binname}-${arch[1]}-${pkgver}.gz")

prepare() {
  cd "${srcdir}" || exit 1

  gzip -dcf "${_binname}-${CARCH}-${pkgver}.gz" > "${_binname}-${CARCH}-${pkgver}"
}

package() {
  cd "${srcdir}" || exit 1

  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  install -Dm644 "${_binname}"      "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "_${_binname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"

  install -Dm644 "${_appid}-${pkgver}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
  install -Dm644 "${_appid}-${pkgver}.desktop" \
    "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm644 "${_appid}-${pkgver}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
  install -Dm644 "${_appid}-${pkgver}.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/${_appid}.policy"

  install -Dm644 "${_appid}.FileManager1-${pkgver}.service" \
    "${pkgdir}/usr/share/dbus-1/services/${_appid}.FileManager1.service"
  install -Dm644 "${_portalservice%.service}-${pkgver}.service" \
    "${pkgdir}/usr/share/dbus-1/services/${_portalservice}"
  install -Dm644 "${_binname}-${pkgver}.portal" \
    "${pkgdir}/usr/share/xdg-desktop-portal/portals/${_binname}.portal"

  install -Dm644 "${_binname}-${pkgver}.service" \
    "${pkgdir}/usr/lib/systemd/user/${_binname}.service"

  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
