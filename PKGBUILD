# Maintainer: TheA4Paper <flatandblank@gmail.com>
# Contributor: maksut <maksut.cagil@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Saiki81 <saikia81 at hotmail dot com>
# adapted from package: pianoteq-stage-trial-bin
# adapted from pkgbuild creator: CrocoDuck <crocoduck dot oducks at gmail dot com>

# the source package must be downloaded manually
# this can be done by going to the link here:
# https://www.modartt.com/download?file=pianoteq_setup_v902.tar.xz
# The downloaded files must be placed in the appropriate directory
# - makepkg: The same directory as this PKGBUILD
# - yay: /home/<user>/.cache/yay/pianoteq-stage
# - paru: /home/<user>/.cache/paru/clone/pianoteq-stage/ 

pkgname=pianoteq-stage
pkgver=9.0.2
pkgrel=2
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=(x86_64 aarch64)
url="https://www.pianoteq.com/pianoteq"
license=('custom')
depends=('alsa-lib' 'freetype2' 'ttf-font' 'libx11')
makedepends=('gendesk')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "pianoteq-stage-bin" "pianoteq-standard-trial-bin")
_name="Pianoteq 9"

#Source file download guide
_sourcefile="./pianoteq_setup_v${pkgver//./}.tar.xz"
if [ ! -f ${_sourcefile} ]; then
  echo ""
  echo "	Due to license and website restriction, to install this package, the distribution file must be downloaded manually."
  echo "	You can download the source file of Pianoteq Stage $pkgver from here:"
  echo ""
  echo "	https://www.modartt.com/download?file=pianoteq_setup_v${pkgver//./}.tar.xz"
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

source=("local://pianoteq_setup_v${pkgver//./}.tar.xz"
  'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
b2sums=('25895a8cf5265f5111f65a28cced5c9efc340dcdf225263bd99ad3b2a71f64fc981a561338ad4ef0f83d1ed187e7606d8eaf6ae26048c2a9d975f18783d49cbc'
        'bbb48b5b2bd5bbe52a39c84f42ea6c12a3633e4713e00d8132654ddf5adc5d7da1b7951c683cb11446ee847a388a775eb48591089a4e8dc69ed6d97cfc80d56d')

prepare() {
  cd "$_name"
  # Generate Desktop Entry
  gendesk -f -n \
    --pkgname=$pkgname \
    --pkgdesc="$pkgdesc" \
    --name="$_name" \
    --exec="\"$_name\"" \
    --categories='Audio;AudioVideo;AudioVideoEditing;Midi;Music;Sequencer;'
}

package() {
  depends+=(libasound.so libfreetype.so libfontconfig.so)
  cd "$_name"

  # Define architecture specific directory
  if [[ "$CARCH" == x86_64 ]]; then
    _archdir=x86-64bit
  elif [[ "$CARCH" == aarch64 ]]; then
    _archdir=arm-64bit
  fi

  # Install stand-alone executable and symlink
  install -vDm 755 "$_archdir/$_name" -t "$pkgdir"/usr/bin
  ln -sf "$_name" "$pkgdir"/usr/bin/${pkgname}${pkgver%%.*}
  # Install VST3 plug-in bundle
  install -vDm 755 "$_archdir/$_name.vst3"/Contents/$CARCH-linux/*.so \
    -t "$pkgdir/usr/lib/vst3/$_name.vst3"/Contents/$CARCH-linux
  # Install LV2 plug-in bundle
  install -vDm 755 "$_archdir/$_name.lv2"/*.so -t "$pkgdir/usr/lib/lv2/$_name.lv2"
  install -vDm 644 "$_archdir/$_name.lv2"/*.ttl -t "$pkgdir/usr/lib/lv2/$_name.lv2"

  # Install desktop launcher
  install -vDm 644 "$srcdir"/pianoteq_icon_128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -vDm 644 $pkgname.desktop -t "$pkgdir"/usr/share/applications

  # Install license
  install -vDm 644 *Licence* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Install documentation
  install -vDm 644 README_LINUX.txt Documentation/* -t "$pkgdir"/usr/share/doc/$pkgname
}

