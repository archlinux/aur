# Maintainer: Zhaofeng Li <hello@zhaofeng.li>

pkgname=gortr
pkgver=0.9.4
pkgrel=1
pkgdesc="An RPKI-to-Router server written in Go"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/cloudflare/gortr"
license=('BSD')
depends=()
makedepends=('go')
options=('!strip' '!emptydirs')
backup=(
  'etc/conf.d/gortr'
)
source=(
  "https://github.com/cloudflare/gortr/archive/${pkgver}.tar.gz"
  'gortr.env'
  'gortr.service'
)

md5sums=('415f8c5c796b627052d1394c056c09d5'
         'b8eb3dab8494b7d031249b7d4ae5a5ba'
         '3a0a969177fb3d8b51c41309e627993a')
_gourl='github.com/cloudflare/gortr'

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p `dirname ${GOPATH}/src/${_gourl}`
  ln -sf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_gourl}"

  cd "${GOPATH}/src/${_gourl}"
  go get -d ./...
}

build() {
  export GOPATH="${srcdir}/go"
  export CGO_ENABLED=0

  cd ${pkgname}-${pkgver}

  go build \
    -ldflags="-w -s" \
    -gcflags="all=-trimpath=${srcdir}" \
    -asmflags="all=-trimpath=${srcdir}" \
    "cmd/gortr/gortr.go"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/gortr.env" "${pkgdir}/etc/conf.d/gortr"
  install -Dm644 "${srcdir}/gortr.service" "${pkgdir}/usr/lib/systemd/system/gortr.service"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
