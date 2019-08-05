# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=gortr
pkgver=0.11.3
pkgrel=1
pkgdesc="An RPKI-to-Router server written in Go"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://github.com/cloudflare/gortr"
license=('BSD')
depends=()
makedepends=('go')
options=('!strip' '!emptydirs')
backup=(
  'etc/conf.d/gortr'
)
source=(
  "https://github.com/cloudflare/gortr/archive/v${pkgver}.tar.gz"
  'gortr.env'
  'gortr.service'
)

md5sums=('543c4ff565192864367b3c33d9dcea02'
         'b8eb3dab8494b7d031249b7d4ae5a5ba'
         '67afd99e5c49c253c8d531d30d1f4f59')
_gourl='github.com/cloudflare/gortr'

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p `dirname ${GOPATH}/src/${_gourl}`
  ln -sf "${srcdir}/gortr-${pkgver}" "${GOPATH}/src/${_gourl}"

  cd "${GOPATH}/src/${_gourl}"
  go get -d ./...
}

build() {
  export GOPATH="${srcdir}/go"
  export CGO_ENABLED=0

  cd gortr-${pkgver}

  go build \
    -ldflags="-w -s" \
    -gcflags="all=-trimpath=${srcdir}" \
    -asmflags="all=-trimpath=${srcdir}" \
    "cmd/gortr/gortr.go"
}

package() {
  install -Dm755 "${srcdir}/gortr-${pkgver}/gortr" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/gortr.env" "${pkgdir}/etc/conf.d/gortr"
  install -Dm644 "${srcdir}/gortr.service" "${pkgdir}/usr/lib/systemd/system/gortr.service"
  install -Dm644 "${srcdir}/gortr-${pkgver}/cmd/gortr/cf.pub" "${pkgdir}/usr/lib/${pkgname}/cf.pub"
  install -Dm644 "${srcdir}/gortr-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
