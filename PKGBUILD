# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='keepalived-exporter'
pkgname="prometheus-${pkgbase}"
pkgver='1.7.0'
pkgrel='1'
pkgdesc='Prometheus exporter for Keepalived'
arch=('x86_64' 'aarch64')
_uri='github.com/mehdy'
url="https://${_uri}/${pkgbase}"
license=('GPL')
depends=('keepalived')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('9d07728737b0b28855c070e123a329fd6d59eaa74e45e9c8cd466bf7c35411e7'
            '8dc0a0bc730eadc6b8fe352923d11bf3499744f187ca8854bb81b8a4578fd558'
            'de3f9cdc0f25c576ca7346ea909a7099dce529483601ea2872ad242fff4db769'
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
  go test -x ./...
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
