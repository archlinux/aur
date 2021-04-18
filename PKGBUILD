# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=pianoteq-standard-trial-bin
pkgver=7.3.0
pkgrel=1
pkgdesc="Physical modelling piano instrument as a standalone program and VST2 and LV2 plugins. STANDARD trial version"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://www.modartt.com/pianoteq"
license=('custom')
groups=('lv2-plugins' 'pro-audio' 'vst-plugins')
depends=('alsa-lib' 'libx11')
makedepends=('gendesk')
optdepends=('jack: JACK support for stand-alone application')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'pianoteq-standard-bin')
source=("local://pianoteq_linux_trial_v${pkgver//./}.7z"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('cde4671cd1957a45c9892513d70d732997744d7462dc21dd347ef85161215013'
            '94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

prepare() {
  # Generate Desktop Entry:
  gendesk -f -n \
    --pkgname "${pkgname%-*}" \
    --pkgdesc "$pkgdesc" \
    --name='Pianoteq 7' \
    --exec="'Pianoteq 7'" \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  # Define architecture specific file directory:
  if [[ "$CARCH" == "x86_64" ]]; then
    archdir='x86-64bit'
  elif [[ "$CARCH" == "armv7h" ]]; then
    archdir='arm-32bit'
  elif [[ "$CARCH" == "aarch64" ]]; then
    archdir='arm-64bit'
  fi

  # Install program files:
  install -Dm 755 "$srcdir/Pianoteq 7/$archdir/Pianoteq 7" \
    "$pkgdir/usr/bin/Pianoteq 7"
  install -Dm 755 "$srcdir/Pianoteq 7/$archdir/Pianoteq 7.so" \
    "$pkgdir/usr/lib/vst/Pianoteq 7.so"
  cd "$srcdir/Pianoteq 7/$archdir/Pianoteq 7.lv2"
  for i in *; do
    install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 7.lv2/$i"
  done
  cd $srcdir

  # Install desktop launcher:
  install -Dm 644 "$srcdir/pianoteq_icon_128.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-*}.png"
  install -Dm 644 "$srcdir/${pkgname%-*}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

  # Install the license:
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "Pianoteq 7"/*Licence* \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # Install the Documentation:
  install -D "Pianoteq 7/README_LINUX.txt" \
    "$pkgdir/usr/share/doc/${pkgname}/README_LINUX.txt"
  cd "$srcdir/Pianoteq 7/Documentation"
  for i in *; do
    install -D "$i" "$pkgdir/usr/share/doc/${pkgname}/$i"
  done
}
