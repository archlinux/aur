# Maintainer: Jadren <jadren@jadren.dev>

pkgname=workbuddy-switch-bin
_pkgname=workbuddy-switch
_binname=wb-switch-rust
pkgver=0.1.62
pkgrel=1
pkgdesc="WorkBuddy / CodeBuddy account switcher with credit expiry monitoring, credit and token stats, and an agent status overlay"
arch=('x86_64')
url="https://github.com/changexbc/workbuddy-switch"
license=('MIT')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/changexbc/workbuddy-switch/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
noextract=("${_pkgname}-${pkgver}-x86_64.deb")
sha256sums=('98123f564753103db10d6ead8e4459bbe8ab234b0eb990071147227af6a3bb3e')
sha256sums_x86_64=('3392b847f670fd4611854eca09c597981570e8e11fa07e0a8607e1e762eb1930')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_pkgname}-${pkgver}-${CARCH}.deb" 'data.tar.*' | bsdtar -xf - -C deb
}

package() {
  install -Dm755 "deb/usr/bin/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  ln -s "${_binname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "deb/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # Upstream leaves Categories empty, so menus file it under "Other"
  sed -i 's/^Categories=.*/Categories=Utility;/' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Upstream's 256x256@2 directory holds a plain 256px icon
  local size
  for size in 32x32 128x128; do
    install -Dm644 "deb/usr/share/icons/hicolor/${size}/apps/${_binname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_binname}.png"
  done
  install -Dm644 "deb/usr/share/icons/hicolor/256x256@2/apps/${_binname}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_binname}.png"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
