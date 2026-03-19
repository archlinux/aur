# Maintainer: Damglador <damglador@gmail.com>

pkgname=wifi-audio-streaming
_pkgname=wifi-audio-streaming

_pkgver=0.2.0-beta
pkgver=${_pkgver//-/}
pkgrel=1
arch=('x86_64')

pkgdesc="A desktop application for streaming audio over a local network."
url="https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop"
license=("MIT")

depends=("java-runtime")
makedepends=("git")
provides=("$_pkgname")

source=(
  "git+${url}#tag=v${_pkgver}"
  "$_pkgname.desktop"
  "$_pkgname.sh"
  )
sha256sums=('feb89d99108bace7daae9d84936e0024679b6ccf36e899aaf3a43500fc9e7ca7'
            'ed518ae2988de998d7cb4aeb476a25fddaed6990a65f5c0db78fa165fbf8f176'
            'f2d72ebb1cdc5c018cac3cdd47ddd5b1c8ee42f6de24a3450dab1e779606da15')

build() {
  cd "WiFiAudioStreaming-Desktop"
  ./gradlew createDistributable

  cd "build/compose/binaries/main/app/WiFi Audio Streaming/lib/app"
  # Remove 400MB of unused libraries
  ls | grep -P ".*-(android|windows|macosx|ios).*"  | xargs -d"\n" rm
  ls | grep -P ".*-linux-(?!(x86_64|x64)).*"        | xargs -d"\n" rm
}

package(){
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  cd "WiFiAudioStreaming-Desktop/build/compose/binaries/main/app/WiFi Audio Streaming/lib"

  install -Dm644 "WiFi Audio Streaming.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -d "$pkgdir/usr/lib/"
  cp -r "app/" "$pkgdir/usr/lib/$_pkgname"
}
