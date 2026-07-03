# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='smartctl_exporter'
pkgver='0.14.0'
pkgrel='3'
pkgdesc='Prometheus exporter for S.M.A.R.T. metrics using smartctl'
arch=('x86_64' 'aarch64')
_uri="github.com/prometheus-community"
url="https://${_uri}/${pkgname}"
license=('GNU')
makedepends=('go')
depends=('smartmontools')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${url}/pull/290.patch"
	"${url}/pull/293.patch")
sha256sums=('0c3a658b1a16117e31e808f6f8852ddc7df5be6edea1b17c08263069b72d88d8'
            '8e67aa678e74b64d500529334001fa029d163cb61146810faeec22401b07d362'
            '2b88ccdd7a0582510721dc8ee54c685d9a92503611517aae9fc34d1b113e124c'
            'c0286315e557649eaf878726b45349086cc395cc280f6beb39a5423a01f50ca5'
            '7b4b124ae3ee4f57101500ec9ea48dbd8d1f7f13602db5369f94f13b915c26fb')
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

  cd "${GOPATH}/src/${_uri}/${pkgname}"
  for e in "${srcdir}/"*".patch"
    do
    echo "Apply patch: ${e}"
    patch -p1 -i "${e}"
  done
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -tags="netgo" \
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
  go test -modcacherw ./...
}

package() {
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
