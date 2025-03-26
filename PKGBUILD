# Maintainer: TheA4Paper <flatandblank@gmail.com>
# Contributor: maksut <maksut.cagil@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Saiki81 <saikia81 at hotmail dot com>
# adapted from package: pianoteq-stage-trial-bin
# adapted from pkgbuild creator: CrocoDuck <crocoduck dot oducks at gmail dot com>

# the source package must be downloaded manually
# this can be done by going to the link here:
# https://www.modartt.com/download?file=pianoteq_stage_linux_v841.7z
# The downloaded files must be placed in the appropriate directory
# - makepkg: The same directory as this PKGBUILD
# - yay: /home/<user>/.cache/yay/pianoteq-stage
# - paru: /home/<user>/.cache/paru/clone/pianoteq-stage/ 

pkgname=pianoteq-stage
pkgver=8.4.1
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('x86_64')
url="https://www.pianoteq.com/pianoteq"
license=('custom')
depends=('alsa-lib' 'freetype2' 'ttf-font' 'libx11')
makedepends=('gendesk' 'p7zip')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "pianoteq-stage-bin" "pianoteq-standard-trial-bin")

_sourcefile="./pianoteq_stage_linux_v${pkgver//./}.7z"
if [ ! -f ${_sourcefile} ]; then
  echo ""
  echo "	Due to license and website restriction, to build this package, the source file must be downloaded manually."
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
  return 1
fi

source=("local://pianoteq_stage_linux_v${pkgver//./}.7z"
  'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
b2sums=('d981a40c51b8272301eb4d2c165d8a6a6bf507c8b58fb849fce14be0ae01f6aa2663a3d210c48c6d9859f5635b6caf546d058784c42d2d7cb9a693995f010598'
  'bbb48b5b2bd5bbe52a39c84f42ea6c12a3633e4713e00d8132654ddf5adc5d7da1b7951c683cb11446ee847a388a775eb48591089a4e8dc69ed6d97cfc80d56d')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='pianoteq 8' --exec='"pianoteq 8"' --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  _pianoteq_type="Pianoteq 8 STAGE"
  archdir=x86-64bit
  # Install program files:
  install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type" "$pkgdir/usr/bin/pianoteq 8"
  install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.so" "$pkgdir/usr/lib/vst/pianoteq 8.so"
  cd "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.lv2"
  for i in *; do
    install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 8.lv2/$i"
  done
  cd $srcdir
  # Install desktop launcher:
  install -Dm 644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
  # Install the license:
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ls -a
  install -m 644 "$_pianoteq_type"/*Licence* "$pkgdir/usr/share/licenses/$pkgname/"
  # Install the Documentation:
  install -D "$_pianoteq_type/README_LINUX.txt" "$pkgdir/usr/share/doc/${pkgname%-*}/README_LINUX.txt"
  cd "$srcdir/$_pianoteq_type/Documentation"
  for i in *; do
    install -D "$i" "$pkgdir/usr/share/doc/${pkgname%-*}/$i"
  done
}
