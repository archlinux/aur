# Maintainer: robertfoster
pkgname=ember-p2p-bin
_pkgname=ember
_appname=Ember
pkgver=1.7.3 # renovate: datasource=github-releases depName=untaimed18/Ember-P2P
pkgrel=1
pkgdesc="Modern eMule KAD client built with Rust and Tauri"
arch=('x86_64')
url="https://github.com/untaimed18/Ember-P2P"
license=('GPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
  'libgcc' 'libsoup3' 'webkit2gtk-4.1'
  'libayatana-appindicator') # dlopen()ed for the tray icon
optdepends=('xdg-utils: open folders and links from the app')
provides=("${_pkgname}-p2p")
conflicts=("${_pkgname}-p2p")
options=('!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/untaimed18/Ember-P2P/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
noextract=("${_appname}_${pkgver}_amd64.deb")

prepare() {
  mkdir -p "${srcdir}/deb"
  bsdtar -xOf "${srcdir}/${_appname}_${pkgver}_amd64.deb" 'data.tar.*' |
    bsdtar -xf - -C "${srcdir}/deb"

  # add the missing trailing ';' to MimeType so desktop-file-validate is happy
  sed -i '/^MimeType=/s/[^;]$/&;/' \
    "${srcdir}/deb/usr/share/applications/${_appname}.desktop"
}

package() {
  cd "${srcdir}/deb/usr"

  install -Dm755 -t "${pkgdir}/usr/bin" "bin/${_pkgname}"

  # bundled resources (GeoIP database) looked up by tauri under /usr/lib/Ember
  install -Dm644 -t "${pkgdir}/usr/lib/${_appname}/resources" \
    "lib/${_appname}/resources/dbip-country-lite.mmdb"
  install -Dm644 -t "${pkgdir}/usr/lib/${_appname}/icons" \
    "lib/${_appname}/icons/icon.ico"

  install -Dm644 -t "${pkgdir}/usr/share/applications" \
    "share/applications/${_appname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/mime/packages" \
    "share/mime/packages/${_pkgname}.xml"

  # tauri drops the 128x128@2x icon into a non-standard "256x256@2" directory
  local _size
  for _size in 32x32 128x128 512x512; do
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/${_size}/apps" \
      "share/icons/hicolor/${_size}/apps/${_pkgname}.png"
  done
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
    "share/icons/hicolor/256x256@2/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('228d2220a7df162b3a7767bc9a74c711f55fea15993e98a2397bf94c5acb741a')
