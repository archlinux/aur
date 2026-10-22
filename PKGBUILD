# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=fastmail
_appid=com.fastmail.Fastmail
_electron='electron43'
pkgver=1.9.0
pkgrel=1
pkgdesc='Desktop app for email, calendar and contacts'
license=('custom:fastmail')
url='https://www.fastmail.com'
arch=('x86_64' 'aarch64')
options=('!strip')
depends=("${_electron}")
makedepends=('desktop-file-utils')
_appimg="${_appid}-${pkgver}-${CARCH}.AppImage"
_dlurl="https://dl.fastmailcdn.com/desktop/production/linux"
source=("${pkgname}.sh"
        "LICENSE.md") # https://www.fastmail.com/policies/terms-of-service/
source_x86_64=("${_appid}-${pkgver}-${arch[0]}.AppImage::${_dlurl}/x64/${_appid}-${pkgver}.AppImage")
source_aarch64=("${_appid}-${pkgver}-${arch[1]}.AppImage::${_dlurl}/arm64/${_appid}-${pkgver}-arm64.AppImage")
sha512sums=('4db398692ff791a7d798bee9d6382e0f48a2ec814f1446ce54ca0c3fb4d6e17c1a2c4cc22e8cf1f209f679ddebc5b6c72f362c81070883c7c6af832965b3e045'
            'e336da034d45735cf62687e8b917e9d995a446685b1341d823ea032f9256751a92ecf5501c48ed4daf18a76df30a3a89b4a6f07aa4f6b2c2d34224c352435d89')
sha512sums_x86_64=('bfecbb026125cd1fb7f7dbc0f3cdb5833f1ae2e1c9a0ac56e67fbf119fedacc87390e63c7c0a0abe861b544d52a8ac0ec11eada0b60ab325102171487946f84d')
sha512sums_aarch64=('5d262f232a9371f6d81e2d87a9a0357bab9455594e30b6d2da88f8f35713e7f3381ff4cef17c1cb87582bc2b995d80a82093c6fe8d0ec69c8fc6d508f96fdf94')

_check_electron() {
  expected_electron="electron$(grep -aoE 'Electron/[0-9]+' squashfs-root/${pkgname} | head -1 | cut -d/ -f2)"
  if [[ "${_electron}" != "${expected_electron}" ]]; then
    echo -e "Using the wrong version of Electron! Expected '\e[32m${expected_electron}\e[0m' but using '\e[31m${_electron}\e[0m'."
    exit 1
  fi
}

prepare() {
  chmod +x "${_appimg}"
  "./${_appimg}" --appimage-extract

  _check_electron
  sed -i "s~@ELECTRON@~${_electron}~" "${pkgname}.sh"

  desktop-file-edit \
    --set-key=Exec \
    --set-value="${pkgname} %U" \
    --set-key=Name \
    --set-value="Fastmail" \
    --remove-key=X-AppImage-Version \
    "squashfs-root/${pkgname}.desktop"
}

package() {
  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd squashfs-root

  install -Dm 644 "resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
  cp -a "resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
  install -Dm 644 "usr/share/metainfo/${_appid}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
  done

  find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} +

  install -Dm 644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
