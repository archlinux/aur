# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='smartctl_exporter'
pkgver='0.15.0'
pkgrel='1'
pkgdesc='Prometheus exporter for S.M.A.R.T. metrics using smartctl'
arch=('x86_64' 'aarch64')
_uri="github.com/prometheus-community"
url="https://${_uri}/${pkgname}"
license=('Apache2.0')
makedepends=('go')
depends=('smartmontools')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/v${pkgver}"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${url}/pull/290.patch"
	"${url}/pull/293.patch")
sha256sums=('19cda1ade2751c0b4b1ace67773234fecdea2827fb9325e255af2774f0e36435'
            '511edb35835b2973bf3103bc9158dfa1541df428c4c3aea39130371e01c657f7'
            '3996649590d84e1870f89adddbd7a2a683d629151b799c5f1f87c1e2e7f5cf10'
            '5e6201273dee78f4fad265209cc539472c5ef66ed77d334d4071a1661f1b40cd'
            'd09008a90977d6d5eb3384a97e49af2393ea583ae07a512594901bf8ddeb2dae'
            'de378881ea8a1f693381cd6a6ad56d09b3a09c78d1a5a9dfa829f3a4933d1a3b')
backup=("etc/conf.d/${pkgname}")

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

  cd "${GOPATH}/src/${_uri}/${pkgname}"
  for e in "${srcdir}/"*".patch"
    do
    echo "Apply patch: ${e}"
    patch -p1 -i "${e}"
  done
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  export CGO_CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -v \
    -tags="netgo" \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-compressdwarf=false -linkmode external -extldflags '${LDFLAGS}' \
    -X github.com/prometheus/common/version.Version=${pkgver} \
    -X github.com/prometheus/common/version.Revision=$(git rev-parse HEAD) \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=$(whoami)@$(hostnamectl hostname) \
    -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  TMPDIR="${GOPATH}/tmp" go test -modcacherw -v ./...
}

package() {
  install -Dm0644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
