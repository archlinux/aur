# Contributor: Andrew Gallant <andrew@burntsushi.net>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wingo-git
pkgver=r427.a56d639
pkgrel=1
pkgdesc="A fully-featured window manager written in Go."
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/wingo"
license=('WTFPL')
makedepends=('git' 'go')
install=${pkgname}.install
_gourl=github.com/BurntSushi/wingo
_gourl2=github.com/BurntSushi/wingo/wingo-cmd

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -u -f -v -x ${_gourl}
  GOPATH="$srcdir" go get -u -f -v -x ${_gourl2}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/wingo "$pkgdir/usr/bin/wingo"
  install -Dm755 bin/wingo-cmd "$pkgdir/usr/bin/wingo-cmd"
  cd "$srcdir/src/${_gourl}"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README.md"
  install -Dm644 COMPLIANCE "$pkgdir/usr/share/doc/${pkgname%-*}/COMPLIANCE"
  install -Dm644 HOWTO-COMMANDS "$pkgdir/usr/share/doc/${pkgname%-*}/HOWTO-COMMANDS"
  install -Dm644 HOWTO-CONFIGURE "$pkgdir/usr/share/doc/${pkgname%-*}/HOWTO-CONFIGURE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"

  mkdir -p $pkgdir/{/usr/share/${pkgname%-*},etc/xdg/${pkgname%-*}}
  cp config/*.wini "$pkgdir/etc/xdg/${pkgname%-*}"
  cd data
  cp *.png "$pkgdir/usr/share/${pkgname%-*}"
  install -Dm644 wingo.wav "$pkgdir/usr/share/${pkgname%-*}/wingo.wav"
  install -Dm644 DejaVuSans.ttf "$pkgdir/usr/share/${pkgname%-*}/DejaVuSans.ttf"
  install -Dm644 archlinux/wingo-git/wingo.desktop "$pkgdir/usr/share/xsessions/wingo.desktop"
}

