# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='smartctl_exporter'
pkgver='0.9.1'
pkgrel='2'
pkgdesc='Export smartctl statistics to prometheus'
arch=('x86_64' 'i686' 'aarch64')
_uri="github.com/prometheus-community"
url="https://${_uri}/${pkgname}"
license=('GNU')
makedepends=('go')
depends=('smartmontools')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service")
sha256sums=('1a65c6f5fd17f3e905d314ac48e387888c7eb656a19a7fafae88fbcdd5cf399a'
            '5645b05537feb19bd57218ed358403ee7e1bc7520a015a2a885730cff35b7367'
            'e0d41ba0648e5d3a2c925bdaa03d41f527cd4aabc2fa450ae3128e86449f1385')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=${pkgver} \
    -X github.com/prometheus/common/version.Revision=$(git rev-parse HEAD) \
    -X github.com/prometheus/common/version.Branch=$(git describe --all --contains --dirty HEAD) \
    -X github.com/prometheus/common/version.BuildUser=$(whoami)@$(hostnamectl hostname) \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)"
}

package() {
  install -Dm755 "${GOPATH}/src/${_uri}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
