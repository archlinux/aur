# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=pianoteq
pkgname=${_pkgname}7
pkgver=7.5.4
pkgrel=1
_name="Pianoteq ${pkgver%%.*}"
pkgdesc='Physical modelling piano instrument standalone program, VST2 and LV2 plugin. Legacy STANDARD version'
arch=(x86_64 aarch64 armv7h)
url='https://www.pianoteq.com/pianoteq'
license=(custom)
depends=(alsa-lib freetype2 ttf-font libxext)
makedepends=(gendesk wget p7zip)
optdepends=(
    'jack: JACK support for stand-alone application'
    'lv2-host: for loading the LV2 plugin'
    'vst-host: for loading the VST2 plugin'
)
provides=($_pkgname)
# the source package must be downloaded manually
# this can be done by going to the link here:
# https://www.modartt.com/download?file=pianoteq_linux_v754.7z
source=("local://pianoteq_linux_v${pkgver//./}.7z"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
b2sums=('2809f79b656e287591f749b56c769031f183d9383ba16cc0daae8452b98a84bae38afd2b6f77c3886494211e12d035042385ea4c165adc24517cfcabcd08ec86'
        'bbb48b5b2bd5bbe52a39c84f42ea6c12a3633e4713e00d8132654ddf5adc5d7da1b7951c683cb11446ee847a388a775eb48591089a4e8dc69ed6d97cfc80d56d')

prepare() {
  cd "$_name"
  # Generate Desktop Entry:
  gendesk -f -n \
    --pkgname=$pkgname \
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
  ln -sf "$_name" "$pkgdir"/usr/bin/$pkgname
  install -Dm 755 "$_archdir/$_name.so" -t "$pkgdir"/usr/lib/vst
  install -Dm 755 "$_archdir/$_name.lv2"/*.so -t "$pkgdir/usr/lib/lv2/$_name.lv2"
  install -Dm 644 "$_archdir/$_name.lv2"/*.ttl -t "$pkgdir/usr/lib/lv2/$_name.lv2"

  # Install desktop launcher:
  install -Dm 644 "$srcdir"/pianoteq_icon_128.png \
    "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm 644 $pkgname.desktop -t "$pkgdir"/usr/share/applications

  # Install the license:
  install -Dm 644 *Licence* -t "$pkgdir"/usr/share/licenses/$pkgname

  # Install the Documentation:
  install -Dm 644 README_LINUX.txt Documentation/* -t "$pkgdir"/usr/share/doc/$pkgname
}
