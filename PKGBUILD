# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
_pkgname=cc-map-editor
pkgname="${_pkgname}-bin"
pkgver=1.8.1
pkgrel=1
pkgdesc="Map Editor for the game CrossCode"
arch=('any')
url='https://github.com/CCDirectLink/crosscode-map-editor'
license=('custom:MIT')
depends=(electron)
makedepends=(asar npm imagemagick)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage_file="${_pkgname}-${pkgver}-linux.AppImage"
source=("https://github.com/CCDirectLink/crosscode-map-editor/releases/download/v${pkgver}/${_appimage_file}"
        "${pkgname}-LICENSE::https://github.com/CCDirectLink/crosscode-map-editor/raw/v${pkgver}/LICENSE"
        "${pkgname}.patch")
noextract=("${_appimage_file}")
sha256sums=('252a47f902e74f7b32f7b0474c889e3259a379fbb127c9f76a361e1a60ebfc5e'
            'a406579cd136771c705c521db86ca7d60a6f3de7c9b5460e6193a2df27861bde'
            '11fde0a67b346874dabb8241393ead51723f3b4e9b75174c52a4b32e79ea9ccd')

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
  cat > "${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=CrossCode Map Editor
Comment=Map Editor for the game CrossCode
Exec=/usr/bin/${_pkgname} %U
TryExec=/usr/bin/${_pkgname}
Terminal=false
Icon=${_pkgname}
StartupWMClass=${_pkgname}
Categories=Game;
EOF

  msg2 "Extracting app.asar..."
  asar extract "squashfs-root/resources/app.asar" "app"

  msg2 "Patching app.asar..."
  (
    cd "app"

    patch --forward --input="${srcdir}/${pkgname}.patch"

    npm --no-audit --no-fund --no-package-lock uninstall electron-log electron-updater
  )

  msg2 "Converting icons..."
  mkdir -p "icons"
  magick "app/distAngular/favicon.ico" -set filename:size "%wx%h" "icons/%[filename:size].png"

  msg2 "Packing app.asar..."
  asar pack "app" "app.asar"
}

package() {
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${pkgname}-${pkgver}"

  install -Dm644 "app.asar" "${pkgdir}/usr/lib/${_pkgname}/app.asar"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  local icon_path icon_name icon_size; for icon_path in "icons/"*; do
    icon_name="${icon_path##*/}"
    icon_size="${icon_name%.png}"
    install -Dm644 "${icon_path}" "${pkgdir}/usr/share/icons/hicolor/${icon_size}/apps/${_pkgname}.png"
  done
}
