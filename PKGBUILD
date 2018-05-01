# Maintainer: Saiki81 <saikia81 at hotmail dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# adapted from package: pianoteq-stage-trial-bin
# adapted from pkgbuild creator: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=pianoteq-stage5
pkgver=5.8.1
pkgrel=2
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('i686' 'x86_64')
url="https://www.pianoteq.com/pianoteq5"
license=('custom')
depends=('alsa-lib' 'freetype2' 'libxext')
makedepends=('gendesk')
optdepends=('jack: JACK audio and MIDI support')
provides=("pianoteq5")
conflicts=("pianoteq5")
source=("local://pianoteq_stage_linux_v${pkgver//./}.7z"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('ae0100a22432e73c2a7df8890b89239f04d3adc5a6d97440af9517e8e75187af'
            '94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

_pianoteq_type="Pianoteq 5 STAGE"
# Define architecture specific file directory:
if [[ "$CARCH" == i686 ]]; then
  archdir=i386
else
  archdir=amd64
fi

build() {
  cd "$srcdir/$_pianoteq_type/"

  # Generate Desktop Entry:
  gendesk -f -n \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --name="${_pianoteq_type}" \
    --exec='pianoteq5' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  cd "$srcdir/$_pianoteq_type/"

  # Install binaries:
  install -Dm 755 "$archdir/${_pianoteq_type}" "$pkgdir/usr/bin/pianoteq5"
  install -Dm 755 "$archdir/${_pianoteq_type}.so" "$pkgdir/usr/lib/vst/pianoteq5.so"

  for i in "$archdir/${_pianoteq_type}.lv2/"*; do
    install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 5.lv2/${i##*/}"
  done

  # Install desktop launcher:
  install -Dm 644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/pianoteq5.desktop"

  # Install the license:
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -m 644 *Licence* "$pkgdir/usr/share/licenses/${pkgname}/"

  # Install the documentation:
  install -D README_LINUX.txt "$pkgdir/usr/share/doc/${pkgname}/README_LINUX.txt"
  for i in "Documentation/"*; do
      install -D "$i" "$pkgdir/usr/share/doc/${pkgname}/${i##*/}"
  done
}
