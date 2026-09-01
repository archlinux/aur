# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='nginx-vts-exporter'
pkgver='0.10.8'
pkgrel='5'
pkgdesc='Prometheus exporter for Nginx vts stats'
arch=('x86_64' 'aarch64')
_uri='github.com/sysulq'
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/v${pkgver}"
        "${pkgname}.service")
sha256sums=('2fc964f1129f732beaf10722380d61754c4f0744c48a2ab11028428eff45ce11'
            '7838c08b3299d2d6d5bb0b6c281f1fcee8f9dc254bfb5e1a8d59699e52495f06')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOTMPDIR="${GOPATH}/tmp"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  mkdir -p "${GOPATH}/src/${_uri}"
  mkdir -p "${GOTMPDIR}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" BUILDTAGS="netgo static_build" \
  go build \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X github.com/prometheus/common/version.Version=${pkgver} \
    -X github.com/prometheus/common/version.Revision=${pkgrel} \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=$(whoami)@$(hostnamectl hostname) \
    -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  TMPDIR="${GOPATH}/tmp" go test -modcacherw ./...
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
