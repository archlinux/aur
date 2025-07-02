# Maintainer: TheA4Paper <flatandblank@gmail.com>
# Contributor: maksut <maksut.cagil@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Saiki81 <saikia81 at hotmail dot com>
# adapted from package: pianoteq-stage-trial-bin
# adapted from pkgbuild creator: CrocoDuck <crocoduck dot oducks at gmail dot com>

# the source package must be downloaded manually
# this can be done by going to the link here:
# https://www.modartt.com/download?file=pianoteq_stage_linux_v843.7z
# The downloaded files must be placed in the appropriate directory
# - makepkg: The same directory as this PKGBUILD
# - yay: /home/<user>/.cache/yay/pianoteq-stage
# - paru: /home/<user>/.cache/paru/clone/pianoteq-stage/ 

pkgname=pianoteq-stage
pkgver=8.4.3
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=(x86_64 aarch64 armv7h)
url="https://www.pianoteq.com/pianoteq"
license=('custom')
depends=('alsa-lib' 'freetype2' 'ttf-font' 'libx11')
makedepends=('gendesk' 'p7zip')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "pianoteq-stage-bin" "pianoteq-standard-trial-bin")
_name="pianoteq8-stage"

#Source file download guide
_sourcefile="./pianoteq_stage_linux_v${pkgver//./}.7z"
if [ ! -f ${_sourcefile} ]; then
  echo ""
  echo "	Due to license and website restriction, to install this package, the distribution file must be downloaded manually."
  echo "	You can download the source file of Pianoteq Stage $pkgver from here:"
  echo ""
  echo "	https://www.modartt.com/download?file=pianoteq_stage_linux_v${pkgver//./}.7z"
  echo ""
  echo "	You must be logged in and own a valid copy of Pianoteq Stage in order to download"
  echo ""
  echo "	The Downloaded file must be placed in the appropriate directory depending on your AUR helper (or lack of thereof) here:"
  echo "		- makepkg: Same directory as this PKGBUILD"
  echo "		- yay: /home/<user>/.cache/yay/pianoteq-stage"
  echo "		- paru: /home/<user>/.cache/paru/clone/pianoteq-stage/                                                                                                    "
  echo ""
  echo "Operation Aborted"
  echo ""
  exit 1
fi

source=("local://pianoteq_stage_linux_v${pkgver//./}.7z"
  'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
b2sums=('c78a40cfbc433d79c2d6ea6fbe63d86c7644816f536904939b5c9687810cf86a08ff2d647205e930acc265bf9b8773c20795960c085c11b1d95e93af264e63e7'
        'bbb48b5b2bd5bbe52a39c84f42ea6c12a3633e4713e00d8132654ddf5adc5d7da1b7951c683cb11446ee847a388a775eb48591089a4e8dc69ed6d97cfc80d56d')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='pianoteq 8' --exec="\"$_name\"" --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  _pianoteq_type="Pianoteq 8 STAGE"
  #ARM support not tested
  if [[ "$CARCH" == x86_64 ]]; then
    archdir=x86-64bit
  elif [[ "$CARCH" == armv7h ]]; then
    archdir=arm-32bit
  elif [[ "$CARCH" == aarch64 ]]; then
    archdir=arm-64bit
  fi

  # Install program files:
  install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type" "$pkgdir/usr/bin/$_name"
  install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.so" "$pkgdir/usr/lib/vst/$_name.so"
  cd "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.lv2"
  for i in *; do
    install -D "$i" "$pkgdir/usr/lib/lv2/$_name.lv2/$i"
  done
  cd $srcdir
  # Install desktop launcher:
  install -Dm 644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
  # Install the license:
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "$_pianoteq_type"/*Licence* "$pkgdir/usr/share/licenses/$pkgname/"
  # Install the Documentation:
  install -D "$_pianoteq_type/README_LINUX.txt" "$pkgdir/usr/share/doc/${pkgname%-*}/README_LINUX.txt"
  cd "$srcdir/$_pianoteq_type/Documentation"
  for i in *; do
    install -D "$i" "$pkgdir/usr/share/doc/${pkgname%-*}/$i"
  done
}
