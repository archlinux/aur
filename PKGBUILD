# Maintainer: robertfoster
pkgname=mangodisk-bin
_pkgname="${pkgname%-bin}"
_appname=MangoDisk
pkgver=1.1.7 # renovate: datasource=github-releases depName=harry0703/MangoDisk
pkgrel=1
pkgdesc="Safety-first disk cleaner and space analyzer with duplicate cleanup and maintenance tools"
arch=('x86_64' 'aarch64')
url="https://github.com/harry0703/MangoDisk"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
  'libgcc' 'libsoup3' 'pango' 'webkit2gtk-4.1'
  'libayatana-appindicator') # dlopen()ed for the resident tray icon
optdepends=('xdg-utils: open folders and links from the app')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/harry0703/MangoDisk/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.deb")
noextract=("${_appname}-${pkgver}-linux-x64.deb" "${_appname}-${pkgver}-linux-arm64.deb")

prepare() {
  mkdir -p "${srcdir}/deb"
  bsdtar -xOf "${srcdir}/${_appname}-${pkgver}"-linux-*.deb 'data.tar.*' |
    bsdtar -xf - -C "${srcdir}/deb"

  # upstream leaves Categories empty, so menus file the launcher under "Other"
  sed -i 's/^Categories=.*/Categories=System;Utility;Filesystem;/' \
    "${srcdir}/deb/usr/share/applications/${_appname}.desktop"
}

package() {
  cd "${srcdir}/deb/usr"

  install -Dm755 -t "${pkgdir}/usr/bin" "bin/${_appname}"
  ln -s "${_appname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/applications" \
    "share/applications/${_appname}.desktop"

  # tauri drops the 128x128@2x icon into a non-standard "256x256@2" directory
  # that icon themes never look up; it is a plain 256x256 image
  local _size
  for _size in 32x32 128x128; do
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/${_size}/apps" \
      "share/icons/hicolor/${_size}/apps/${_appname}.png"
  done
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
    "share/icons/hicolor/256x256@2/apps/${_appname}.png"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('2ac53e4b61b780af5e2493799881a21e73d738b15f9e7fc979c76fc9d0472e74')
sha256sums_aarch64=('f370c84f284b04910e5269af2c5138425588808448119b7aa2b3d91abbea0283')
