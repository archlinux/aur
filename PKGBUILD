pkgname=adw-network-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Modern network management application for GNOME (prebuilt binary)"
arch=('x86_64')
url="https://github.com/PlayRood32/adw-network"
license=('GPL3')

depends=('gtk4' 'libadwaita' 'gdk-pixbuf2' 'networkmanager')

provides=('adw-network' 'adwaita-network')
conflicts=('adw-network' 'adwaita-network')

options=('!debug' 'strip')

source=(
  "https://github.com/PlayRood32/adw-network/releases/download/v${pkgver}/adwaita-network-linux-x86_64.tar.gz"
  "com.github.adw-network.desktop::https://raw.githubusercontent.com/PlayRood32/adw-network/main/data/com.github.adw-network.desktop"
  "icon.png::https://raw.githubusercontent.com/PlayRood32/adw-network/main/data/icons/hicolor/scalable/apps/icon.png"
)

sha256sums=(
  'a506c23397f493fcc1f3d05f0dda9698bb029438f5b4cd1eeadc3658ddcf71ca' #tar.gz
  '87e22132167fdb6372cf4fbdf1a60a0449e8ef1e5889d1a156a8eb540c069038'
  '518a328abee19239ba5f20bcbfe3f15c474bc5c18b8adcb37c9793ecf7c640cc'
)

package() {
  local bin
  bin="$(find "${srcdir}" -maxdepth 2 -type f -name 'adwaita-network' -perm -u+x | head -n 1)"

  if [[ -z "${bin}" ]]; then
    printf 'error: adwaita-network binary not found in %s\n' "${srcdir}" >&2
    return 1
  fi

  # main binary
  install -Dm755 "${bin}" "${pkgdir}/usr/bin/adwaita-network"

  # alias binary (THIS WAS MISSING)
  ln -sf adwaita-network "${pkgdir}/usr/bin/adw-network"

  install -Dm644 "${srcdir}/com.github.adw-network.desktop" \
    "${pkgdir}/usr/share/applications/com.github.adw-network.desktop"

  install -Dm644 "${srcdir}/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/icon.png"
}
