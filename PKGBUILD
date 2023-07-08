# Maintainer: Zach Hoffman <zrhoffman@apache.org>

pkgname=(flashplugin-debug pepper-flash-debug)
pkgver=32.0.0.465
pkgrel=3
pkgdesc="Adobe Flash Player debugger"
arch=('x86_64')
url="https://www.adobe.com/support/flashplayer/debug_downloads.html"
makedepends=('bbe')
license=('custom' 'LGPL')
options=('!strip')
source=(flash_player_npapi_linux_debug_$pkgver.x86_64.tar.gz::https://archive.org/download/adobe-flash-player-32.0.0.465-retail-debug/flash_player_npapi_linux_debug.x86_64.tar.gz
        flash_player_ppapi_linux_debug_$pkgver.x86_64.tar.gz::https://archive.org/download/adobe-flash-player-32.0.0.465-retail-debug/flash_player_ppapi_linux_debug.x86_64.tar.gz)
noextract=(${source[@]%::*})
sha256sums=('7e4c598349e271634b3b190540ac70d7e0f20e7d161cd5359d611e4fd807e712'
            '63348acd3f3b8f18b89c5abce41a057211b2d08c476a924835b719f2830435d5')

prepare() {
  local _dir
  for f in ${noextract[@]}; do
    _dir=$(grep -Eo '([np]papi)' <<< $f)
    mkdir -p $_dir
    tar xfC $f $_dir
  done
}

remove_eol_time_bomb() {
  local plugin_file="$1";
  shift;
  # From https://cache.tehsausage.com/flash/defuse.txt
  time_bomb_trigger='\x40\x46\x3E\x6F\x77\x42'
  if grep "$(printf "$time_bomb_trigger")" "$plugin_file"; then
    echo "Found flash player EOL time bomb in ${plugin_file}. Removing it..."
    bbe -o "${plugin_file}.patched" -e "s/\x00\x00${time_bomb_trigger}/\x00\x00\x00\x00\x00\x00\xF8\x7F/" "$plugin_file"
    mv "${plugin_file}.patched" "$plugin_file"
    sync
    echo "Removed flash player EOL time bomb from ${plugin_file}"
  else
    echo "Did not find flash player EOL time bomb in ${plugin_file}."
  fi
}

package_flashplugin-debug() {
  pkgdesc+=" NPAPI"
  depends=('libxt' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
  optdepends=('libvdpau: GPU acceleration on Nvidia cards')
  provides=("flashplugin=${pkgver}")
  conflicts=('flashplugin')

  cd npapi
  remove_eol_time_bomb libflashplayer.so
  install -Dm644 libflashplayer.so "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.so"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf LGPL/notice.txt

  install -D -t "$pkgdir/usr/bin" usr/bin/flash-player-properties
  cp -a usr/share/{applications,icons} "$pkgdir/usr/share/"

}

package_pepper-flash-debug() {
  pkgdesc+=" PPAPI"
  depends=('gcc-libs')
  optdepends=('flashplugin-debug: settings utility')
  provides=("pepper-flash=${pkgver}")
  conflicts=('pepper-flash')

  cd ppapi
  remove_eol_time_bomb libpepflashplayer.so
  install -Dm644 -t "$pkgdir/usr/lib/PepperFlash" manifest.json libpepflashplayer.so
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.pdf LGPL/notice.txt
}

# vim:set ts=2 sw=2 et:
