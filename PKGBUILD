# Maintainer: czyt <czytcn@gmail.com>

pkgname=mygo-music-bin
pkgver=0.1.24
pkgrel=1
pkgdesc="A native music player you extend with plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/egoist/mygo-music"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'gtk3' 'libpulse' 'webkit2gtk-4.1')
optdepends=(
  'libayatana-appindicator: system tray icon'
  'libsecret: store account credentials in the system keyring'
  'gtk-layer-shell: Wayland layer-shell panels (mini player)'
)
provides=('mygo-music')
conflicts=('mygo-music')
options=('!strip' '!debug')

_deb_x86_64="mygo-music_${pkgver}_amd64.deb"
_deb_aarch64="mygo-music_${pkgver}_arm64.deb"
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('7d60912813563aba5e6ad5be92d60e1cad5fa73ce02c3e72c7300215d70a81f4')
sha256sums_aarch64=('3d4ec9d701e9a87080ec1c7767559f346a0e7f7d1d5dee8072a1fa75db766ffb')
source_x86_64=("${_deb_x86_64}::${url}/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::${url}/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")

package() {
  local _deb_var="_deb_${CARCH}"
  local _deb="${!_deb_var}"
  local _data_archive
  _data_archive=$(bsdtar -tf "${srcdir}/${_deb}" | awk '/^data\.tar(\.|$)/ { print; exit }')
  [[ -n "$_data_archive" ]] || return 1
  bsdtar -xOf "${srcdir}/${_deb}" "$_data_archive" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" || return 1

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/mygo-music/mygo-music "${pkgdir}/usr/bin/mygo-music"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod -R u=rwX,go=rX "${pkgdir}/opt/mygo-music"
}
