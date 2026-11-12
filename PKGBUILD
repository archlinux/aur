pkgname=super-paste-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Clipboard manager with local OCR and synchronization (upstream binary)'
arch=('x86_64')
url='https://github.com/Teddy-Zhu/super_paste_app'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'gtk-layer-shell' 'librsvg' 'openssl' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('kwin: KDE Plasma 6 Wayland window integration'
            'xdg-desktop-portal: global shortcuts on Wayland'
            'gnome-keyring: Secret Service credential storage')
provides=('super-paste')
conflicts=('super-paste')
options=('!strip' '!debug')
_upstreamver='1.0.1'
_debfile="super-paste_${_upstreamver}_x86_64-unknown-linux-gnu.deb"
_deburl="${url}/releases/download/v${_upstreamver}/${_debfile}"
_licenseurl="https://raw.githubusercontent.com/Teddy-Zhu/super_paste_app/v${_upstreamver}/LICENSE"
source=("${_debfile}::${_deburl}"
        "LICENSE::${_licenseurl}")
sha256sums=('4f1e7888a038ad6ee4857065de4355e3eaa195223ea01fb44d55d5de7069e9bd'
            'a8f796fa5f04306af3584fd06051cc72673585b80ed604843df1fd385bc12971')

package() {
  local data_archive
  data_archive=$(bsdtar -tf "${srcdir}/${_debfile}" | grep -E '^data\.tar\.' | head -n 1)
  [[ -n "${data_archive}" ]] || return 1
  bsdtar -xOf "${srcdir}/${_debfile}" "${data_archive}" | bsdtar -xf - -C "${pkgdir}"
  local desktop="${pkgdir}/usr/share/applications/Super Paste.desktop"
  local icon='/usr/share/icons/hicolor/256x256@2/apps/super_paste.png'
  [[ -f "${desktop}" && -f "${pkgdir}${icon}" ]] || return 1
  # An absolute icon path avoids stale theme lookups in desktop launchers.
  sed -i "s|^Icon=.*$|Icon=${icon}|" "${desktop}"
  grep -qxF "Icon=${icon}" "${desktop}" || return 1
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
