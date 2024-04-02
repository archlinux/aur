# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=MIDI2.0Workbench
pkgname=midi2-workbench
pkgver=1.5.6
_ver=${pkgver}p
pkgrel=1
pkgdesc='MIDI 2.0 debugging utility'
arch=(x86_64)
url='https://github.com/midi2-dev/MIDI2.0Workbench'
license=(MIT)
_electron=electron27
depends=($_electron gcc-libs glibc)
makedepends=(alsa-lib node-gyp npm systemd-libs)
groups=(pro-audio)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/midi2-dev/$_name/archive/refs/tags/v$_ver.tar.gz"
  'midi2-workbench.sh'
  'midi2-workbench.desktop'
)
sha256sums=('317fe57e371af684c557c167de0d5a824fe231b58af6a7baece8d565ddf76bf2'
            '79191c43cc81a733e4f24f929f5b489bcc10e5c2256dec6507d04fdb34862e3d'
            'fe31fc81dfc72fbbb131c3a187b90cd924948c1bad5a0cbb6421771b92eb2c8c')
case $CARCH in
 aarch64) _arch=arm64 ;;
 x86_64) _arch=x64 ;;
 i686) _arch=ia32 ;;
esac

prepare() {
  _npmargs=("--openssl-fips=''" --cache "$srcdir"/npm-cache --no-audit --no-fund)
  _electron_ver="$(< /usr/lib/$_electron/version)"
  cd $_name-$_ver
  # remove unused dependencies
  sed -e /serialport/d -e /bonjour-service/d -e /cobs/d -e /sanitize-filename/d -i package.json
  HOME="$srcdir"/.electron-gyp npm "${_npmargs[@]}" install --os linux --cpu $_arch
  # don't use prebuilt binaries
  rm -r node_modules/usb/prebuilds
  # use system node-gyp
  ln -sf /usr/bin/node-gyp node_modules/.bin/node-gyp
}

build() {
  cd $_name-$_ver
  npx "${_npmargs[@]}" electron-builder -- \
    --linux --$_arch --dir \
    -c.electronDist=/usr/lib/$_electron \
    -c.electronVersion=$_electron_ver \
    -c.asar=false \
    --publish=never
}

package() {
  depends+=(libasound.so libudev.so)
  install -vDm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -vDm644 $pkgname.desktop -t "$pkgdir"/usr/share/applications

  cd $_name-$_ver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  cd dist/linux-unpacked/resources
  # some cleanup
  rm -rf app/{midi2usb,winmidi2,*.png}
  install -d "$pkgdir"/usr/lib
  cp -a app "$pkgdir"/usr/lib/$pkgname
}
