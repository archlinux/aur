# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Maintainer: napaalm <nap@napaalm.xyz>
# Contributor: spider-mario <spidermario@free.fr>

_name="Pianoteq 8"
pkgname=pianoteq
pkgver=8.2.0
pkgrel=1
pkgdesc="Physical modelling piano instrument as a standalone program, VST2 and LV2 plugin"
arch=(aarch64 armv7h x86_64)
url='https://www.modartt.com/pianoteq'
license=(custom)
depends=(freetype2 gcc-libs glibc ttf-font libxext)
makedepends=(gendesk)
optdepends=(
  'jack: for using the JACK backend'
  'lv2-host: for loading the LV2 plugin'
  'vst-host: for loading the VST2 plugin'
)
conflicts=(pianoteq-stage pianoteq-standard-trial-bin)
# The source package must be downloaded manually.
# This can be done by going to the link here:
# https://www.modartt.com/download?file=pianoteq_linux_v810.7z
source=("local://pianoteq_linux_v${pkgver//./}.7z"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('304d2ead47358f050aa60fb905d6b0628f5686f32caf3b584d53ab253571b646'
            '94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

prepare() {
  gendesk -f -n \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --name='Pianoteq 8' \
    --exec='pianoteq8' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  depends+=(libfreetype.so libasound.so)
  cd "$_name"

  # Define architecture specific directory
  # (i686 is no longer supported):
  if [[ "$CARCH" == x86_64 ]]; then
    _archdir=x86-64bit
  elif [[ "$CARCH" == armv7h ]]; then
    _archdir=arm-32bit
  elif [[ "$CARCH" == aarch64 ]]; then
    _archdir=arm-64bit
  fi

  # Install the program files:
  install -Dm 755 "$_archdir/$_name" -t "$pkgdir"/usr/bin
  ln -sf "$_name" "$pkgdir"/usr/bin/${pkgname}${pkgver%%.*}

  # Install the LV2 plugin bundle:
  install -Dm644 "$_archdir/$_name.lv2"/*.ttl -t "$pkgdir/usr/lib/lv2/$_name.lv2"
  install -Dm755 "$_archdir/$_name.lv2"/${_name/ /_}.so -t "$pkgdir/usr/lib/lv2/$_name.lv2"

  # Install the VST2 plugin (same binary as the one in the LV2 bundle):
  install -dm755 "$pkgdir"/usr/lib/vst
  ln -sf "../lv2/$_name.lv2/${_name/ /_}.so" "$pkgdir/usr/lib/vst/$_name.so"

  # Install desktop launcher:
  install -Dm 644 "$srcdir"/pianoteq_icon_128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm 644 "$srcdir"/$pkgname.desktop -t "$pkgdir"/usr/share/applications/

  # Install the license:
  install -Dm644 Licence* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Install the documentation:
  install -Dm644 README_LINUX.txt Documentation/* -t "$pkgdir"/usr/share/doc/$pkgname
}
