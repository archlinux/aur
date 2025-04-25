# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='smartctl_exporter'
pkgver='0.14.0'
pkgrel='1'
pkgdesc='Prometheus exporter for S.M.A.R.T. metrics using smartctl'
arch=('x86_64' 'aarch64')
_uri="github.com/prometheus-community"
url="https://${_uri}/${pkgname}"
license=('GNU')
makedepends=('go')
depends=('smartmontools')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service")
sha256sums=('0c3a658b1a16117e31e808f6f8852ddc7df5be6edea1b17c08263069b72d88d8'
            '5645b05537feb19bd57218ed358403ee7e1bc7520a015a2a885730cff35b7367'
            '089ce0787b99c05d59b3f00447b50543851bd190f02679dd41a5ea094caea1cf')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
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
    -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
