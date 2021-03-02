# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
_pkgname=cc-map-editor
pkgname="${_pkgname}-bin"
pkgver=0.9.2
pkgrel=1
pkgdesc="A Map Editor for the game CrossCode"
arch=('any')
url='https://github.com/CCDirectLink/crosscode-map-editor'
license=('custom:MIT')
depends=(electron)
makedepends=(asar npm jq)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage_file="${_pkgname}-${pkgver}-linux.AppImage"
source=("https://github.com/CCDirectLink/crosscode-map-editor/releases/download/v${pkgver}/${_appimage_file}"
        "${pkgname}-LICENSE::https://github.com/CCDirectLink/crosscode-map-editor/raw/v${pkgver}/LICENSE"
        "${pkgname}-patch-desktop-entry.awk"
        "${pkgname}-disable-autoupdates.patch")
noextract=("${_appimage_file}")
sha256sums=('e75b184085d37655f3b8461d4d7d20e4ba4adf0b7ca939397a415ff9545cd52a'
            'a406579cd136771c705c521db86ca7d60a6f3de7c9b5460e6193a2df27861bde'
            'c03a2ede59f0476176c1a32d28ac19e907e76b1dbfdffa93d9eefa40d868506b'
            '44f1235757748bf2744f69be9c08abfc66859aa34cac93c3a477b5eb3d233abc')

prepare() {
  mkdir -p "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"

  msg2 "Extracting ${_appimage_file}..."
  chmod +x "${srcdir}/${_appimage_file}"
  # extracts the AppImage contents into a directory called `squashfs-root`, see
  # <https://docs.appimage.org/user-guide/run-appimages.html#extract-the-contents-of-an-appimage>
  "${srcdir}/${_appimage_file}" --appimage-extract 2>/dev/null

  msg2 "Generating ${_pkgname}.sh..."
  cat > "${_pkgname}.sh" <<EOF
#!/bin/sh
exec electron /usr/lib/${_pkgname}/app.asar "\$@"
EOF

  msg2 "Generating ${_pkgname}.desktop..."
  awk -f "${srcdir}/${pkgname}-patch-desktop-entry.awk" -v executable_path="/usr/bin/${_pkgname}" \
    "squashfs-root/${_pkgname}.desktop" > "${_pkgname}.desktop"

  msg2 "Extracting app.asar..."
  asar extract "squashfs-root/resources/app.asar" "app"

  msg2 "Patching app.asar..."
  (
    cd "app"

    patch --forward --input="${srcdir}/${pkgname}-disable-autoupdates.patch"

    echo "patching file package.json"
    jq '.dependencies |= del(.["electron-log", "electron-updater"])' package.json > package.json.new
    mv package.json.new package.json

    npm prune --no-audit --no-fund --production
  )

  msg2 "Packing app.asar..."
  asar pack "app" "app.asar"
}

package() {
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${pkgname}-${pkgver}"

  install -Dm644 "squashfs-root/resources/app.asar" "${pkgdir}/usr/lib/${_pkgname}/app.asar"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  local icon_size icon_path; for icon_size in 16 32 48 64 128 256; do
    icon_path="usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${_pkgname}.png"
    install -Dm644 "squashfs-root/${icon_path}" "${pkgdir}/${icon_path}"
  done
}
