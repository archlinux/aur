# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='s3_exporter'
pkgname='prometheus-s3-exporter'
pkgver='0.6.1'
pkgrel='3'
pkgdesc='Exports Prometheus metrics about S3 buckets and objects'
arch=('x86_64' 'aarch64')
_uri='github.com/qaoru'
url="https://${_uri}/${pkgbase}"
license=('Apache 2.0')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('af6ea5aaa50834e5895f680f4964f92c20e4b0c8944205bb1b49373f85488215'
            '843215c4f5035d1a168ec418743661d5f7763deda5b52316531e50bdc8f1f48c'
            '953587ceeebe37042ad6f88ffcaf7bcf2adfe5397e02ca6ec7ee79543c0f5050'
            'f0ce7020311240c6ee1ca7cf3168944c5883b3bd6f86f8fe39089ff3d9ed2dba')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgbase}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgbase}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" BUILDTAGS="netgo static_build" \
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=${pkgver} \
    -X github.com/prometheus/common/version.Revision=${pkgrel} \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=$(whoami)@$(hostnamectl hostname) \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)"
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
