# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
pkgname=(flashplugin pepper-flash)
pkgver=32.0.0.465
pkgrel=1
pkgdesc="Adobe Flash Player"
arch=('x86_64')
url="https://get.adobe.com/flashplayer/"
license=('custom' 'LGPL')
options=('!strip')
source=("flash_player_npapi_linux_$pkgver.x86_64.tar.gz::https://fpdownload.adobe.com/get/flashplayer/pdc/$pkgver/flash_player_npapi_linux.x86_64.tar.gz"
        "flash_player_ppapi_linux_$pkgver.x86_64.tar.gz::https://fpdownload.adobe.com/get/flashplayer/pdc/$pkgver/flash_player_ppapi_linux.x86_64.tar.gz"
        "flash_player_npapi_linux_$pkgver.x86_64-defuse_time_bomb.patch"
        "flash_player_ppapi_linux_$pkgver.x86_64-defuse_time_bomb.patch")
noextract=("${source[@]%::*}")
sha256sums=('a90f2edb98231896331c61a81017f390e180015f90193865e3295319cf636c35'
            '99fcc780897be55bac7d11c0204ba7a3d5e7dc1f1aed75d5e7b5ad28c0b2ff5d'
            '52cb9e361f8b40f279ea62b9a49021de3fab7d825b1eab944c290d1f9ced14c7'
            'b71806b14583edf3ae7f5e759b23c2cb14f649c2e59495e39e5e5876128fd575')

prepare() {
  local _f
  for _f in *.tar.gz; do
    local _dir=$(grep -Eo '([np]papi)' <<< "$_f")
    mkdir -p "$_dir"
    tar xzfC "$_f" "$_dir"
    patch -Np1 -d "$_dir" \
      -i "$srcdir/flash_player_${_dir}_linux_$pkgver.x86_64-defuse_time_bomb.patch"
  done
}

package_flashplugin() {
  pkgdesc+=" NPAPI (with time bomb workaround patch)"
  depends=('libxt' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
  optdepends=('libvdpau: GPU acceleration on Nvidia cards')

  cd "$srcdir/npapi"
  install -Dm644 -t "$pkgdir/usr/lib/mozilla/plugins" libflashplayer.so 
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf LGPL/notice.txt

  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/flash-player-properties
  cp -a usr/share/{applications,icons} "$pkgdir/usr/share"
}

package_pepper-flash() {
  pkgdesc+=" PPAPI (with time bomb workaround patch)"
  depends=('gcc-libs')
  optdepends=('flashplugin: settings utility')

  cd "$srcdir/ppapi"
  install -Dm644 -t "$pkgdir/usr/lib/PepperFlash" manifest.json libpepflashplayer.so
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf LGPL/notice.txt
}
