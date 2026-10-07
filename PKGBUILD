# Maintainer: robertfoster
pkgname=omniphony-studio-bin
_pkgname="${pkgname%-bin}"
_appname="Omniphony Studio"
pkgver=0.6.0 # renovate: datasource=github-releases depName=mgth/Omniphony extractVersion=^v(?<version>\d.+)$
pkgrel=1
pkgdesc="Omniphony Studio (Tauri) control and 3D visualization UI for the orender spatial audio engine (binary release)"
arch=('x86_64')
url="https://github.com/mgth/Omniphony"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
  'libgcc' 'libsoup3' 'librsvg' 'pipewire' 'wayland' 'webkit2gtk-4.1'
  'libayatana-appindicator') # dlopen()ed for the tray icon
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'orender')
options=('!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/mgth/Omniphony/v${pkgver}/LICENSE"
  "${url}/releases/download/v${pkgver}/Omniphony.Studio_${pkgver}_amd64.deb")
noextract=("Omniphony.Studio_${pkgver}_amd64.deb")

prepare() {
  mkdir -p "${srcdir}/deb"
  bsdtar -xOf "${srcdir}/Omniphony.Studio_${pkgver}_amd64.deb" 'data.tar.*' |
    bsdtar -xf - -C "${srcdir}/deb"

  # upstream leaves Categories empty, so menus file the launcher under "Other"
  sed -i 's/^Categories=.*/Categories=AudioVideo;Audio;/' \
    "${srcdir}/deb/usr/share/applications/${_appname}.desktop"
}

package() {
  cd "${srcdir}/deb/usr"

  install -Dm755 -t "${pkgdir}/usr/bin" bin/omniphony-studio bin/orender

  # Tauri resource dir; the exact path (spaces included) is what the app looks up
  install -dm755 "${pkgdir}/usr/lib"
  cp -r --no-preserve=ownership "lib/${_appname}" "${pkgdir}/usr/lib/"
  find "${pkgdir}/usr/lib/${_appname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/lib/${_appname}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/lib/${_appname}/engine/liborender.so.0"

  install -Dm644 "share/applications/${_appname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps" \
    share/icons/hicolor/512x512/apps/omniphony-studio.png

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '3778249ce9d3fb0b341f720876e371294c6993814f3668dda58e32cd5d7c2b71')
