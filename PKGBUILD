# Maintainer: Damglador <damglador@gmail.com>

pkgname=wifi-audio-streaming
_pkgname=wifi-audio-streaming

_pkgver=0.3.0-beta
pkgver=${_pkgver//-/}
pkgrel=2
arch=('x86_64')

pkgdesc="A desktop application for streaming audio over a local network."
url="https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop"
license=("MIT")

depends=("java-runtime" "pipewire-alsa")
makedepends=("git")
provides=("$_pkgname")

source=(
  "git+${url}#tag=v${_pkgver}"
  "$_pkgname.desktop"
  "$_pkgname.sh"
  )
sha256sums=('a85dc3a51973f3e7e98636a2f06ee649e00e915bbea2e10194259ece029b16d2'
            'ed518ae2988de998d7cb4aeb476a25fddaed6990a65f5c0db78fa165fbf8f176'
            'ca1de798c0b6ba482448d35bf92d7dc3cb2585d7ca9a5d442063e9397ade754d')

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
