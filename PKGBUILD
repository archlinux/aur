# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
pkgname=(flashplugin pepper-flash)
pkgver=32.0.0.465
pkgrel=2
pkgdesc="Adobe Flash Player"
arch=('x86_64')
url="https://get.adobe.com/flashplayer/"
license=('custom' 'LGPL-3.0-or-later')
options=('!strip')
source=("flash_player_npapi_linux_$pkgver.x86_64.tar.gz::https://web.archive.org/web/20210126102538if_/https://fpdownload.adobe.com/get/flashplayer/pdc/$pkgver/flash_player_npapi_linux.x86_64.tar.gz"
        "flash_player_ppapi_linux_$pkgver.x86_64.tar.gz::https://web.archive.org/web/20210116212416if_/https://fpdownload.adobe.com/get/flashplayer/pdc/$pkgver/flash_player_ppapi_linux.x86_64.tar.gz")
noextract=("${source[@]%%::*}")
sha256sums=('a90f2edb98231896331c61a81017f390e180015f90193865e3295319cf636c35'
            '99fcc780897be55bac7d11c0204ba7a3d5e7dc1f1aed75d5e7b5ad28c0b2ff5d')

prepare() {
  cd "$srcdir"

  local _f
  for _f in "${noextract[@]}"; do
    local _dir="$(grep -o '[np]papi' <<<"$_f")"
    mkdir -p "$_dir"
    tar xzfC "$_f" "$_dir"
  done

  # From https://cache.tehsausage.com/flash/defuse.txt
  sed -i 's/\x00\x00\x40\x46\x3E\x6F\x77\x42/\x00\x00\x00\x00\x00\x00\xF8\x7F/' \
    npapi/libflashplayer.so ppapi/libpepflashplayer.so
}

package_flashplugin() {
  pkgdesc+=" NPAPI"
  depends=('libxt' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
  optdepends=('libvdpau: GPU acceleration on Nvidia cards')

  cd "$srcdir/npapi"
  install -Dm644 -t "$pkgdir/usr/lib/mozilla/plugins" libflashplayer.so
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf LGPL/notice.txt

  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/flash-player-properties
  cp -a usr/share/{applications,icons} "$pkgdir/usr/share"
}

package_pepper-flash() {
  pkgdesc+=" PPAPI"
  depends=('gcc-libs')
  optdepends=('flashplugin: settings utility')

  cd "$srcdir/ppapi"
  install -Dm644 -t "$pkgdir/usr/lib/PepperFlash" manifest.json libpepflashplayer.so
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf LGPL/notice.txt
}
