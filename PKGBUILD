pkgname=gitmun-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A cross-platform Git GUI built with Tauri"
arch=('x86_64')
url="https://github.com/cst8t/gitmun"
license=('GPL-3.0-only')
provides=('gitmun')
conflicts=('gitmun')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'git'
  'glib2'
  'gtk-update-icon-cache'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
  'xdg-desktop-portal'
  'zenity'
)
options=('!strip' '!debug' '!emptydirs')
install=gitmun.install

source=("LICENSE.gitmun")
source_x86_64=("https://github.com/cst8t/gitmun/releases/download/v0.12.0/gitmun_0.12.0-1_amd64.deb")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('6a20f06c5e9a6cf662ece946102bb1f73f28257bc98abd0e6d44b80e7c9c0bd5')

package() {
  cd "${srcdir}"
  ar x "gitmun_0.12.0-1_amd64.deb"
  local _data_tar
  _data_tar=""
  for _candidate in data.tar.zst data.tar.xz data.tar.gz data.tar.bz2; do
    if [[ -f "${_candidate}" ]]; then
      _data_tar="${_candidate}"
      break
    fi
  done

  if [[ -z "${_data_tar}" ]]; then
    echo "No data.tar.* payload found in gitmun_0.12.0-1_amd64.deb" >&2
    return 1
  fi

  bsdtar -xf "${_data_tar}" -C "${pkgdir}"
  install -Dm644 /dev/null "${pkgdir}/usr/share/gitmun/system-managed"
  install -Dm644 "LICENSE.gitmun" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
