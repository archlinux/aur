# Maintainer: jim3692 <jim3692 at gmail.com>
pkgname="pipewire-screenaudio-git"
pkgver=0.1.0.r1.g28a3df2
pkgver() {
  cd "pipewire-screenaudio"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Extension to passthrough pipewire audio to WebRTC Screenshare"
arch=('x86_64')
url="https://github.com/IceDBorn/pipewire-screenaudio"
license=('MIT')
depends=(
  'util-linux'
  'gawk'
  'jq'
  'pipewire'
  'pipewire-pulse'
  'libpipewire'
  )
makedepends=(
  'git'
  'cmake'
  )
options=(!lto)
conflicts=()
provides=('pipewire-screenaudio')
source=(
  'git+https://github.com/IceDBorn/pipewire-screenaudio.git'
  )
sha256sums=(
  'SKIP'
  )

build() {
  cd "$srcdir/pipewire-screenaudio"
  git submodule update --init

  cd "native"
  bash build.sh
}

package() {
  install -Dm644 "$srcdir/pipewire-screenaudio/native/native-messaging-hosts/firefox.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.icedborn.pipewirescreenaudioconnector.json"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/connector/pipewire-screen-audio-connector.sh" "$pkgdir/usr/lib/pipewire-screenaudio/connector/pipewire-screen-audio-connector.sh"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/connector/watcher.sh" "$pkgdir/usr/lib/pipewire-screenaudio/connector/watcher.sh"
  install -Dm755 "$srcdir/pipewire-screenaudio/native/out/pipewire-screenaudio" "$pkgdir/usr/lib/pipewire-screenaudio/out/pipewire-screenaudio"
}
