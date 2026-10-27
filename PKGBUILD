# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ovirt_exporter'
pkgname='prometheus-ovirt-exporter'
pkgver='0.10.3'
pkgrel='1'
pkgdesc='Exporter for oVirt engine metrics'
arch=('x86_64' 'aarch64')
_uri="github.com/czerwonk/${pkgbase}"
url="https://${_uri}"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/v${pkgver}"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('82a335f145d66ffe1ae1633101e21988577bebae202534f5992395e302ac4aa9'
            '4c0b259e8a1c1e20d332fd381078106d5af1c77c8660c525dc7a2a8b2a9e3003'
            '97575042cd248ca1067749826c2f4555b84828871575a018d2f15a757ebfc702'
            '0e434a9a889b2dffff44c83b92eac87ee786c0570c9c76eb577714a830f4872d')
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
  ln -snf "${srcdir}/${pkgbase}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgbase}"

}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  export CGO_CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -tags="netgo" \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-compressdwarf=false -linkmode external -extldflags '${LDFLAGS}'"
}

package() {
  install -Dm0755 "${pkgbase}-${pkgver}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${pkgbase}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
