# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=birdwatcher
pkgver=r190.5b5b1e2
pkgrel=1
pkgdesc="An HTTP API server for the BIRD routing daemon"
arch=('x86_64' 'i686')
url="https://github.com/ecix/birdwatcher"
license=('BSD')
depends=()
makedepends=('go')
options=('!strip' '!emptydirs')
source=(
  'birdwatcher4.service'
  'birdwatcher6.service'
)
md5sums=('98c680d53e514274a309ee2d9e3a09b6'
         '5cafb43834c8212e421246e8cd8186c7')
_gourl=github.com/ecix/birdwatcher

pkgver() {
  cd "go/src/${_gourl}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p go
  export GOPATH="${srcdir}/go"

  go get -d -x "${_gourl}"
}

build() {
  export GOPATH="${srcdir}/go"
  export CGO_ENABLED=0

  mkdir -p bin
  cd bin

  go build \
    -ldflags="-w -s" \
    -gcflags="all=-trimpath=${GOPATH}/src" \
    -asmflags="all=-trimpath=${GOPATH}/src" \
    "${_gourl}"
}

package() {
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "go/src/${_gourl}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "go/src/${_gourl}/etc/ecix/birdwatcher.conf" "${pkgdir}/etc/birdwatcher.conf"
  install -Dm644 "${srcdir}/birdwatcher4.service" "${pkgdir}/usr/lib/systemd/system/birdwatcher4.service"
  install -Dm644 "${srcdir}/birdwatcher6.service" "${pkgdir}/usr/lib/systemd/system/birdwatcher6.service"
}

# vim:set ts=2 sw=2 et:
