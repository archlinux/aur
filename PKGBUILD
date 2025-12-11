# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=pianoteq-trial-bin
pkgver=9.1.0
pkgrel=1
_name="Pianoteq ${pkgver%%.*}"
pkgdesc='Physical modelling piano instrument standalone program, VST3 and LV2 plugin. Trial version'
arch=(aarch64 armv7h x86_64)
url="https://www.modartt.com/pianoteq"
license=(LicenseRef-EULA)
groups=(lv2-plugins pro-audio vst3-plugins)
depends=(alsa-lib fontconfig freetype2 gcc-libs glibc libglvnd ttf-font)
makedepends=(gendesk)
optdepends=(
  'jack: JACK support for stand-alone application'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading the VST3 plugin'
)
provides=(${pkgname%-*})
conflicts=(${pkgname%-*} pianoteq-standard-bin pianoteq-standard-trial-bin pianoteq-stage-trial-bin)
source=("local://pianoteq_trial_v${pkgver//./}.tar.xz"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('c02053545299ecd9792041c5237bf27df550755b4dac6dc52e9c61eaff47e847'
            '94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

prepare() {
  cd "$_name"
  # Generate Desktop Entry:
  gendesk -f -n \
    --pkgname=${pkgname%-*} \
    --pkgdesc="$pkgdesc" \
    --name="$_name" \
    --exec="\"$_name\"" \
    --categories='Audio;AudioVideo;AudioVideoEditing;Midi;Music;Sequencer;'
}

package() {
  depends+=(libasound.so libfreetype.so libfontconfig.so)
  cd "$_name"

  # Define architecture specific directory:
  if [[ "$CARCH" == x86_64 ]]; then
    _archdir=x86-64bit
  elif [[ "$CARCH" == armv7h ]]; then
    _archdir=arm-32bit
  elif [[ "$CARCH" == aarch64 ]]; then
    _archdir=arm-64bit
  fi

  # Install stand-alone executable and symlink
  install -Dvm 755 "$_archdir/$_name" -t "$pkgdir"/usr/bin
  ln -sf "$_name" "$pkgdir"/usr/bin/${pkgname%-bin}-${pkgver%%.*}
  # Install VST3 plug-in bundle
  install -vDm 755 "$_archdir/$_name.vst3"/Contents/$CARCH-linux/*.so \
    -t "$pkgdir/usr/lib/vst3/$_name.vst3"/Contents/$CARCH-linux
  # Install LV2 plug-in bundle
  install -vDm 755 "$_archdir/$_name.lv2"/*.so -t "$pkgdir/usr/lib/lv2/$_name.lv2"
  install -vDm 644 "$_archdir/$_name.lv2"/*.ttl -t "$pkgdir/usr/lib/lv2/$_name.lv2"

  # Install desktop launcher
  install -vDm 644 "$srcdir"/pianoteq_icon_128.png \
    "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png
  install -vDm 644 ${pkgname%-*}.desktop -t "$pkgdir"/usr/share/applications

  # Install license
  install -vDm 644 *Licence* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Install documentation
  install -vDm 644 README_LINUX.txt Documentation/* -t "$pkgdir"/usr/share/doc/$pkgname
}
