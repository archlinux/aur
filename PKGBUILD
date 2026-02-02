# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ovirt_exporter'
pkgname='prometheus-ovirt-exporter'
pkgver='0.10.2'
pkgrel='1'
pkgdesc='Exporter for oVirt engine metrics'
arch=('x86_64' 'aarch64')
_uri='github.com/czerwonk'
url="https://${_uri}/${pkgbase}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('8697fc9c448e25a54f11845064d2b053825223dc414480ba52267561fd5877f3'
            'dddb55bc9a696c56814ce4d34f6254469bf215c59629b3225546775f680a13c3'
            'eaa4a1c1ace61a45124ec5769d904707894796049b0c5104b511af62a9f3783b'
            '0e434a9a889b2dffff44c83b92eac87ee786c0570c9c76eb577714a830f4872d')
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
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" BUILDTAGS="netgo static_build" \
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}'"
}

package() {
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgbase}/${pkgbase}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
