# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=pianoteq-stage-trial-bin
pkgver=8.0.5
pkgrel=1
_name="Pianoteq ${pkgver%%.*} STAGE"
pkgdesc='Physical modelling piano instrument standalone program, VST2 and LV2 plugin. STAGE trial version'
arch=(x86_64 armv7h aarch64)
url="https://www.modartt.com/pianoteq"
license=(custom)
groups=(lv2-plugins pro-audio vst-plugins)
depends=(alsa-lib libx11)
makedepends=(gendesk)
optdepends=(
    'jack: JACK support for stand-alone application'
    'lv2-host: for loading the LV2 plugin'
    'vst-host: for loading the VST2 plugin'
)
provides=(${pkgname%-*})
conflicts=(${pkgname%-bin} pianoteq-stage-bin)
source=("local://pianoteq_stage_linux_trial_v${pkgver//./}.7z"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('f4ba387b548cd60c36ffe4e6a4351d6423907071294ff69a1ba3fcd3f1913d06'
            '94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

prepare() {
  cd "$_name"
  # Generate Desktop Entry:
  gendesk -f -n \
    --pkgname=${pkgname%-*} \
    --pkgdesc="$pkgdesc" \
    --name="$_name" \
    --exec="\"$_name\"" \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  cd "$_name"

  # Define architecture specific directory:
  if [[ "$CARCH" == x86_64 ]]; then
    _archdir=x86-64bit
  elif [[ "$CARCH" == armv7h ]]; then
    _archdir=arm-32bit
  elif [[ "$CARCH" == aarch64 ]]; then
    _archdir=arm-64bit
  fi

  # Install executables and plugins:
  install -Dm 755 "$_archdir/$_name" -t "$pkgdir"/usr/bin
  ln -sf "$_name" "$pkgdir"/usr/bin/${pkgname%-bin}-${pkgver%%.*}
  install -Dm 755 "$_archdir/$_name.so" -t "$pkgdir"/usr/lib/vst
  install -Dm 755 "$_archdir/$_name.lv2"/*.so -t "$pkgdir/usr/lib/lv2/$_name.lv2"
  install -Dm 644 "$_archdir/$_name.lv2"/*.ttl -t "$pkgdir/usr/lib/lv2/$_name.lv2"

  # Install desktop launcher:
  install -Dm 644 "$srcdir"/pianoteq_icon_128.png \
    "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png
  install -Dm 644 ${pkgname%-*}.desktop -t "$pkgdir"/usr/share/applications

  # Install the license:
  install -Dm 644 *Licence* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Install the Documentation:
  install -Dm 644 README_LINUX.txt Documentation/* -t "$pkgdir"/usr/share/doc/$pkgname
}
