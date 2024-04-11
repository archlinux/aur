# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=(flashplugin-zorange pepper-flash-zorange)
pkgver=34.0.0.137
pkgrel=1
pkgdesc="Zorange Adobe Flash Player"
arch=('x86_64')
url="https://www.flash.cn/download"
license=('custom')
options=('!strip')
source=("flash_player_npapi_linux_$pkgver.x86_64.tar.gz::https://github.com/darktohka/clean-flash-builds/releases/download/v1.7/flash_player_patched_npapi_linux.x86_64.tar.gz"
        "flash_player_ppapi_linux_$pkgver.x86_64.tar.gz::https://github.com/darktohka/clean-flash-builds/releases/download/v1.7/flash_player_patched_ppapi_linux.x86_64.tar.gz")
noextract=("${source[@]%%::*}")
sha256sums=('bddbebc5bf3b0aa4974eea23797daf9ca8627f740e64108e52460b06bf32fba5'
            'fca4fd08f40639fc495c3f58a1877e7ea023ccb19f0a6466a396e418dee5a186')

prepare() {
  cd "$srcdir"
  for _f in "${noextract[@]}"; do
    _dir="$(grep -o '[np]papi' <<<"$_f")"
    mkdir -p "$_dir"
    tar xzfC "$_f" "$_dir"
  done
}

package_flashplugin-zorange() {
  pkgdesc+=" NPAPI"
  depends=('libxt' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
  optdepends=('libvdpau: GPU acceleration on Nvidia cards')

  cd "$srcdir/npapi"
  install -Dm644 -t "$pkgdir/usr/lib/mozilla/plugins" libflashplayer.so
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf

  install -Dm755 -t "$pkgdir/usr/bin" usr/bin/flash-player-properties
  cp -a usr/share/{applications,icons} "$pkgdir/usr/share"

  # kcm4 long gone
  sed -i '/NotShowIn=KDE;/d' \
    "$pkgdir/usr/share/applications/flash-player-properties.desktop"
}

package_pepper-flash-zorange() {
  pkgdesc+=" PPAPI"
  depends=('gcc-libs')
  optdepends=('flashplugin: settings utility')

  cd "$srcdir/ppapi"
  install -Dm644 -t "$pkgdir/usr/lib/PepperFlash" manifest.json libpepflashplayer.so
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf
}
