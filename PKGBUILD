# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=go-synth
pkgver=20121119
pkgrel=1
pkgdesc='Go synth'
arch=('x86_64' 'i686')
url='https://github.com/nf/gosynth'
license=('BSD')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl='github.com/nf/gosynth'

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

#check() {
#  source /etc/profile.d/go.sh
#  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
#}

package() {
  source /etc/profile.d/go.sh

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,bin} "${pkgdir}/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done

  # cleanup
  rm -rf "$pkgdir/$GOPATH/src/github.com/nf/gosynth/.git"

  # link to /usr/bin
  mkdir -p "$pkgdir/usr/bin"
  ln -s "$GOPATH/bin/gosynth" "$pkgdir/usr/bin/gosynth"
}

# vim:set ts=2 sw=2 et:
