# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='s3_exporter'
pkgname='prometheus-s3-exporter'
pkgver='0.7.0'
pkgrel='1'
pkgdesc='Exports Prometheus metrics about S3 buckets and objects'
arch=('x86_64' 'aarch64')
_uri='github.com/qaoru'
url="https://${_uri}/${pkgbase}"
license=('Apache 2.0')
makedepends=('go')
source=("${pkgbase}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgbase}/tar.gz/refs/tags/v${pkgver}"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('9f5031803dc53a126fd5e75fc8e74eb4468205aa653fdcb9602860d4bd442e41'
            'ac3bdd890acd17959373368b31285d14bede2390fd4a09f97a613a50537b8629'
            '836f21de06fc5d2db6b71d33450d8b2ab66e5e94aee1efa12ac45edae6bbba3b'
            'f0ce7020311240c6ee1ca7cf3168944c5883b3bd6f86f8fe39089ff3d9ed2dba')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgbase}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgbase}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -tags="netgo" \
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

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
