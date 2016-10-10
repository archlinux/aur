# Maintainer: thor alfakrøll roht dott no
pkgname=ssv2leds-git
_pkgname=ssv2leds
pkgver=20160811
pkgrel=0
pkgdesc="Utility to control the LEDs of the SteelSeries Siberia V2 Frost Edition headset"
arch=('x86_64' 'i686')
url="https://github.com/antage/ssv2leds"
makedepends=('git' 'go>=1.3.0')
depends=('go-mtpfs-git')
options=('!strip' '!emptydirs')
source=("git+https://github.com/antage/ssv2leds.git")
md5sums=("SKIP")
_gourl="github.com/antage/ssv2leds"

pkgver() {
	cd "$srcdir/ssv2leds"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$_pkgname/$f"
    fi
  done
}
