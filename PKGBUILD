# Maintainer: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>
# Contributor: Ciro Scognamiglio <ciro.scognamiglio88 at gmail dot com>

pkgname='bzr-player'
pkgver='2.0.74'
pkgrel='3'
pkgdesc='Audio player supporting a wide array of multi-platform exotic file formats'
arch=('i686' 'x86_64')
url="http://bzrplayer.blazer.nu"
license=('GPL3')
depends=('wine' 'hicolor-icon-theme')
optdepends=('lib32-pipewire: PipeWire audio driver')
makedepends=('gendesk' 'libarchive')
options=(!strip)
_zip="BZR-Player-$pkgver.zip"
_setup="bzr2_setup.sh"
_mimes="x-bzr-player.xml"
source=("$_zip::https://github.com/aargirakis/BZRPlayer/releases/download/${pkgver}/BZR-Player-${pkgver}.zip"
  "$pkgname.sh"
  "https://raw.githubusercontent.com/aargirakis/BZRPlayer/refs/heads/main/src/inst/$_setup"
  "https://raw.githubusercontent.com/aargirakis/BZRPlayer/refs/heads/main/src/inst/$_mimes")
noextract=("$_zip")
sha256sums=('df94081478e87e7bdd16564cf6217cab5f48220f82b8f03ccfac66ea5f482f38'
  'SKIP'
  'SKIP'
  'SKIP')

prepare() {
  mkdir -p "${pkgname}-bin"
  bsdtar -xf "$_zip" -C "${pkgname}-bin"

  mapfile -t mime_types_supported < <(sed -n "\|mime_types_supported=(| , \|)|{p; \|)|q}" "$_setup" |
    sed -e 's:mime_types_supported=(::g' -e 's:)::g' -e 's: :\n:g' | sed '/^[[:space:]]*$/d')

  for mime_type in "${mime_types_supported[@]}"; do
    desktop_entry_mime_types="$desktop_entry_mime_types$mime_type;"
  done

  desktop_entry_mime_types="${desktop_entry_mime_types%?}"

  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name="BZR Player" \
    --genericname='Audio player' \
    --exec="/usr/bin/$pkgname.sh %U" \
    --icon="$pkgname" \
    --categories='AudioVideo;Audio;Music;Player;' \
    --mimetype="$desktop_entry_mime_types"
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share"
  cp -a "${pkgname}-bin" "$pkgdir/usr/share/$pkgname"
  install -Dm644 "${pkgname}-bin/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_mimes" "$pkgdir/usr/share/mime/packages/$_mimes"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "$pkgdir/usr/share/$pkgname/data/resources/icon.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
}
