# Maintainer: Faruk Dikcizgi <boogiepop@gmx.de>
# Contributor: Adrian Lopez <adrianlzt@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=droidmote-bin
pkgver=3.0.6
pkgrel=1
pkgdesc='Server for DroidMote. Use your androd as remote mouse and keyboard.'
arch=('i686' 'x86_64' 'aarch64' 'arm7f')
url='http://www.videomap.it/'
license=('custom:unknown')
makedepends=('curl')
depends=('libx11')
backup=("etc/droidmote.conf")
source=("droidmote.conf"
        "service")
sha256sums=('b6386dec0977b27dff244e04f4fdbf5becc4c12731a261678524c21ffb3e53a4'
            '0e88c9e0b189e0d8890ddbee8f00da13485973e028811e4e70a8b1c2b7595bbe')

pkgver(){
  local _ver=$(curl -Ls https://www.videomap.it/download.htm | grep -o1Ei 'inux\s([0-9\.]+)')
  printf "${_ver#inux }"
}

build(){
  local _arch="`uname -m`"
  local _target=""
  case "$_arch" in
    x86 | i?86)
      _target="dms-ubuntu-x32"
      ;;
    x86_64 | amd64)
      _target="dms-ubuntu-x64"
      ;;
    armel)
      _target="dms-ubuntu-arm"
      ;;
    arm64 | aarch64)
      _target="dms-ubuntu-arm64"
      ;;
    arm*)
      _target="dms-ubuntu-arm"
    ;;
    *) error 2 "Invalid architecture '$_arch'.";;
  esac
  curl -L "https://videomap.it/script/$_target" -o droidmote
  chmod +x droidmote
}

package() {
  install -D droidmote "${pkgdir}/usr/bin/droidmote"
  install -Dm644 "droidmote.conf" "${pkgdir}/etc/droidmote.conf"
  install -Dm644 "service" "${pkgdir}/usr/lib/systemd/system/droidmote.service"
}
