# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='frr-exporter'
_pkgname='frr_exporter'
pkgname="prometheus-${pkgbase}"
pkgver='1.4.0'
pkgrel='1'
pkgdesc='Prometheus exporter for Free Range Routing'
arch=('x86_64' 'aarch64')
_uri='github.com/tynany'
url="https://${_uri}/${_pkgname}"
license=('GPL')
makedepends=('go')
depends=('frr')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('b41682d2d94c057690a20b2b3c154fd3aac835e5280c29a3c06f8600d92d0876'
            '4f1e7484d3ffe14e39edce43b8183c96da3dda69ff580dc232cc39f6bad5c2bd'
            '241ae6fd3be0ea4cdec1f455195ef1b5a96edc48c2bce9f9c0a2a95347d4e712'
            'b27dc51dab9d09e0caafeaeb6866174313f50f86724147c653b87ed7d431c814')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${_pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgbase}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -tags "netgo" \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X github.com/prometheus/common/version.Version=${pkgver} \
    -X github.com/prometheus/common/version.Revision=$(git rev-parse HEAD) \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=$(whoami)@$(hostnamectl hostname) \
    -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  go test -x ./...
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
