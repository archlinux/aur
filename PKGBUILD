# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='keepalived-exporter'
pkgname="prometheus-${pkgbase}"
pkgver='1.7.1'
pkgrel='2'
pkgdesc='Prometheus exporter for Keepalived'
arch=('x86_64' 'aarch64')
_uri='github.com/mehdy'
url="https://${_uri}/${pkgbase}"
license=('GPL')
depends=('keepalived>=2.2.7-2')
makedepends=('go')
source=("${pkgbase}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgbase}/tar.gz/refs/tags/v${pkgver}"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('e17022c7e1e63d145e473a17702ee1023c574db06bb460f9d6e39017c3c74bb4'
            '3a1d17478bc66f0fc76ddd83ffd4d7ff116631fec915ea444b508789e2c5e89f'
            'e617ee53931ce5d3556c8b64e6037d96192ba0a424f508e2a91055b54e23af88'
            'd52f807f4d965b4f8a22238013a3476a1accf941e962b9a0866e58e0ec4676f4')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgbase}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgbase}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X github.com/prometheus/common/version.Version=${pkgver} \
    -X github.com/prometheus/common/version.Revision=$(git rev-parse HEAD) \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=$(whoami)@$(hostnamectl hostname) \
    -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})" \
    "./cmd/${pkgbase}"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  go test -modcacherw -x ./...
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
