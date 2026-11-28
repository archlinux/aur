pkgname=super-paste-bin
pkgver=1.0.4
pkgrel=1
pkgdesc='Native GPUI clipboard manager with OCR and settings synchronization (upstream binary)'
arch=('x86_64')
url='https://github.com/Teddy-Zhu/super_paste_app'
license=('MIT')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'libx11' 'libxcb' 'xcb-util-cursor' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libglvnd' 'vulkan-icd-loader' 'gtk3' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('kwin: KDE Plasma 6 Wayland integration'
            'xdg-desktop-portal: global shortcuts on Wayland'
            'gnome-keyring: Secret Service credential storage')
provides=('super-paste')
conflicts=('super-paste' 'super-paste-rs')
options=('!strip' '!debug' '!lto')
_upstreamver='1.0.4'
_debfile="super-paste_${_upstreamver}_x86_64-unknown-linux-gnu.deb"
source=("${_debfile}::${url}/releases/download/v${_upstreamver}/${_debfile}"
        "LICENSE::https://raw.githubusercontent.com/Teddy-Zhu/super_paste_app/v${_upstreamver}/LICENSE")
noextract=("${_debfile}")
sha256sums=('e1f73fb9b3d1e716894fa7029304d7c75da7d6cf84d7e26fc862485087b86f59'
            'a8f796fa5f04306af3584fd06051cc72673585b80ed604843df1fd385bc12971')

package() {
  local data_archive
  data_archive=$(bsdtar -tf "${srcdir}/${_debfile}" | grep -E '^data\.tar\.' | head -n 1)
  [[ -n "${data_archive}" ]] || return 1
  bsdtar -xOf "${srcdir}/${_debfile}" "${data_archive}" | bsdtar -xf - -C "${pkgdir}"
  [[ -x "${pkgdir}/usr/bin/super-paste" ]] || return 1
  [[ -f "${pkgdir}/usr/share/applications/com.v2dawn.superpaste.rs.desktop" ]] || return 1
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
