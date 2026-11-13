# Maintainer: George Alexiou <goten002@gmail.com>

pkgname=luna-modeler
pkgver=15.0.0
pkgrel=1
pkgdesc="Database design tool for relational databases (commercial, 14-day trial)"
arch=('x86_64')
url="https://www.datensen.com/products/luna-modeler/"
license=('LicenseRef-Luna-Modeler-EULA')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libcups' 'libgcc' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr'
         'nss' 'pango' 'systemd-libs')
makedepends=('imagemagick')
optdepends=('unixodbc: Microsoft SQL Server connections over ODBC')
options=('!strip' '!debug')
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://www.datensen.com/downloads/Luna%20Modeler-${pkgver}-x86_64.AppImage"
        "${pkgname}.desktop")
noextract=("${_appimage}")
sha256sums=('bf62eec6e19d019901b19870ad0bbf23400674eb7337e00bc9e29a59bfe78b7a'
            '3e0ac7b6de1d8abfb5dd954eb1c41ed193f72af227b2b15fa60c865354ab4472')

prepare() {
  chmod +x "${_appimage}"
  rm -rf squashfs-root
  "./${_appimage}" --appimage-extract >/dev/null
}

build() {
  # Upstream ships only a 512x512 icon.
  local size
  for size in 16 32 48 64 128 256; do
    magick squashfs-root/usr/share/icons/hicolor/512x512/apps/luna.png -resize "${size}x${size}" "icon-${size}.png"
  done
  cp squashfs-root/usr/share/icons/hicolor/512x512/apps/luna.png icon-512.png
}

package() {
  local appdir="${pkgdir}/usr/lib/${pkgname}"
  install -d "${appdir}"
  # The Electron app as shipped, minus the AppImage glue (AppRun, bundled
  # legacy libs in usr/, top-level desktop file and icon links).
  cp -a squashfs-root/. "${appdir}/"
  rm -rf "${appdir}"/{AppRun,usr,.DirIcon,luna.png,luna.desktop}
  chmod -R u+rwX,go+rX,go-w "${appdir}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/luna" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done

  install -Dm644 squashfs-root/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
