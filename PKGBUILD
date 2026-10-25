# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi
pkgver=1.5.5
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=(glibc)
makedepends=(go)
# backup=(etc/spoofdpi.toml)
options=(!debug)
source=(
  "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.service"
)
sha256sums=('7aab199ffa2b356f9b89cbb01f352fcf1f907aed4424c0e65c6471007f9c9a57'
            '8a61496c8621adbbc7b986388f9b2107e4c080d0d6e4d5a8dcb31a992dbc6ffc')

prepare() {
  cd "${pkgname}-${pkgver}"

  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"

  export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
  export _LDFLAGS="${_LDFLAGS} -linkmode=external"
  export _LDFLAGS="${_LDFLAGS} -X main.version=${pkgver}"
  export _LDFLAGS="${_LDFLAGS} -X main.commit=$(cat COMMIT)"
  export _LDFLAGS="${_LDFLAGS} -X main.build=archlinux"
  export _LDFLAGS="${_LDFLAGS} -extldflags \"${LDFLAGS}\""
  export GOPATH="${srcdir}"
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "${_LDFLAGS}" \
    -o build \
    ./cmd/spoofdpi
}

package() {
  cd "${pkgname}-${pkgver}/build"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
