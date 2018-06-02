# Maintainer: veecue <veecue@ventos.tk>

_pkgname=pacmon
pkgname=$_pkgname-git
pkgver=20180602
pkgrel=1
pkgdesc="A zero-configuration, fast and simple pacman LAN-mirror as a replacement for pacserve"
arch=('x86_64' 'i686' 'armv6' 'armv7')
url="https://github.com/veecue/pacmon"
license=('GPL')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
_gopkg="github.com/veecue/$_pkgname"
source=("git+https://$_gopkg")
sha256sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")
install=pacmon.install

build() {
  mkdir -p "$srcdir/src/$_gopkg"
  cp -r "$srcdir/$_pkgname/"* "$srcdir/src/$_gopkg"
  GOPATH="$srcdir" go install -ldflags='-s -w' $_gopkg 
}

check() {
  GOPATH="$srcdir" go test $_gopkg
}

package() {
  install -pDm755 "$srcdir/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -pDm644 "$srcdir/src/$_gopkg/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -pDm644 "$srcdir/src/$_gopkg/pacmon-mirrorlist.hook" "$pkgdir/usr/share/libalpm/hooks/pacmon-mirrorlist.hook"
  install -pDm644 "$srcdir/src/$_gopkg/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
