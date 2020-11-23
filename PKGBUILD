# Maintainer: Andy Nicholson <andrew@anicholson.net>
# Contributors: teutat3s

pkgname=k6
pkgver=0.29.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript"
arch=('x86_64' 'i686')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
depends=('go>=1.14')
options=('!strip' '!emptydirs')
_gourl=github.com/loadimpact/k6
_modname=${_gourl}@v${pkgver}
_default_gopath=${HOME}/go

build() {
  if [ -d ${GOPATH-$_default_gopath}/pkg/mod/${_modname} ]; then
    chmod -R 0755 ${GOPATH-${HOME}/go}/pkg/mod/${_gourl}@v$pkgver
  fi

  GO111MODULE=on GOFLAGS="-trimpath" go get ${_modname}
  chmod -R 0755 ${GOPATH-${HOME}/go}/pkg/mod/${_gourl}@v$pkgver
}

check() {
  local GOPATH=${GOPATH-$_default_gopath}
  test -e $GOPATH/bin/k6
  $GOPATH/bin/k6 version | grep -q "k6 v${pkgver}"
}

package() {
  # module-aware go will still put binaries in
  # a GOPATH - using default ~/go if not specified.
  local GOPATH=${GOPATH-$_default_gopath}

  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$GOPATH/bin/k6" "$pkgdir/usr/bin"
  install -Dm644 "$GOPATH/pkg/mod/${_modname}/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
