# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bitmagnet-beta
_pkgname="${pkgname%-beta}"
pkgver=0.10.1_beta.1
pkgrel=1
pkgdesc='A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.'
arch=(x86_64 aarch64 armv7h)
url='https://bitmagnet.io'
license=('MIT')
depends=(glibc)
makedepends=(go)
optdepends=(
  'grafana: dashboards'
  'loki: logs'
  'postgresql: database'
  'prometheus: metrics'
  'pyroscope: profiling'
  'redis: cache'
)
backup=(etc/bitmagnet/config.yml)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=(
  "${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/bitmagnet-io/bitmagnet/archive/refs/tags/v${pkgver//_/-}.tar.gz"
  config.yml
  bitmagnet.service
  bitmagnet.sysusers
  bitmagnet.tmpfiles
)
sha256sums=('53a4cf792fdfc9c516b86b17ad0bffc9bd6a9cfaa6c6292de1aff86a04d71483'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'e9f8ee3b561297d673ca52c6e2dd98a061a4d5569542d3cd80703c25e854d404'
            '9eab02f76a22e3ff627bd6f7fe609480ced67c076f079e985a34d41d13fe8f08'
            '0972b20f948b5e685c659dfefa7a4e200f75fa12dfe9d4779ef3ad5c8ffdca86')

prepare() {
  cd "${_pkgname}-${pkgver//_/-}"

  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "${_pkgname}-${pkgver//_/-}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
  export _LDFLAGS="${_LDFLAGS} -linkmode=external"
  export _LDFLAGS="${_LDFLAGS} -X github.com/bitmagnet-io/bitmagnet/internal/version.GitTag=v${pkgver//_/-}"
  export _LDFLAGS="${_LDFLAGS} -extldflags \"${LDFLAGS}\""
  export GOPATH="${srcdir}"

  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "${_LDFLAGS}" \
    -o "${_pkgname}"
}

package() {
  cd "${_pkgname}-${pkgver//_/-}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/config.yml" "${pkgdir}/etc/bitmagnet/config.yml"
  install -Dm644 "${srcdir}/bitmagnet.service" "${pkgdir}/usr/lib/systemd/system/bitmagnet.service"
  install -Dm644 "${srcdir}/bitmagnet.sysusers" "${pkgdir}/usr/lib/sysusers.d/bitmagnet.conf"
  install -Dm644 "${srcdir}/bitmagnet.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bitmagnet.conf"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -dpr --no-preserve=ownership observability "${pkgdir}/usr/share/${pkgname}/"
}
