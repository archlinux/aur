# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='transceiver-exporter'
pkgname="prometheus-${pkgbase}"
pkgver='1.5.1'
pkgrel='1'
pkgdesc='Prometheus exporter for Optical Transeiver OAM data'
arch=('x86_64' 'aarch64')
_uri='github.com/wobcom'
url="https://${_uri}/${pkgbase}"
license=('GPL')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('b27b643975a58f22b561d7f71dff972150b21c6b84a9a66907da8e8397e4a456'
            '9900f9ed20f8e3cd0f24fe585e1f403bb6c052a218bb9e81f6cbb53e52803942'
            'e71cd38eb040bc5b7f73f105d9d8dd2bcf83d74cbe1e3d796fbcb25a972a905a'
            'c8b4a9a31c29855ed033ffe981ae675ac6dd4399bb11f813d053bb0cd156b4d5')
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
    -ldflags "-linkmode external -extldflags '${LDFLAGS}'"
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
