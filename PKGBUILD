# Maintainer: haxxordan

pkgname=seraphirc-bin
_pkgname=seraphirc
pkgver=6.0.1
pkgrel=1
pkgdesc="Modern desktop IRC client built with Go and Wails (prebuilt binary)"
arch=('x86_64')
url="https://www.seraphirc.chat/"
license=('custom')
depends=(
  'desktop-file-utils'
  'gnome-keyring'
  'gst-libav'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libsecret'
  'webkit2gtk-4.1'
)
provides=('seraphirc')
conflicts=('seraphirc')
options=('!strip')
source=("seraphirc_${pkgver}_amd64.deb::https://github.com/seraphirc/seraphirc-download/releases/download/v${pkgver}/seraphirc_${pkgver}_amd64.deb")
sha256sums=('6288201c1ef2c8b2fcabbf17d33b1dacd826dcee4bfdd7742dead2ea570073d1')

package() {
  local deb="${srcdir}/seraphirc_${pkgver}_amd64.deb"
  local unpack="${srcdir}/deb-unpack"

  mkdir -p "${unpack}"
  bsdtar -xf "${deb}" -C "${unpack}"

  local data_archive
  data_archive="$(find "${unpack}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)"
  if [[ -z "${data_archive}" ]]; then
    error "Could not find data.tar.* in upstream Debian package"
    return 1
  fi

  bsdtar -xf "${data_archive}" -C "${pkgdir}"

  install -Dm644 "${pkgdir}/usr/share/doc/seraphirc/LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
