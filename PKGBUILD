# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-auth-oauth2'
pkgver='1.24.0'
pkgrel='1'
pkgdesc='A Plugin/management interface client for OpenVPN server to handle an OIDC based single sign-on (SSO) auth flows'
arch=('x86_64' 'aarch64')
_uri="github.com/jkroepke"
url="https://${_uri}/${pkgname}"
license=('MTI')
makedepends=('go')
depends=('openvpn>=2.6.2')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('60bc503a24ddfde8f9dddbca8c59004ba7d29a9983dad1e27436d74357ee6d4b'
            'de967f8fd8bacc904e5de610ebd1c5c54420634e3c52c500ef27c51bd605d41c'
            '9ecd0f74d0292120937d39411a3a829ec7983f7c96022f971b5e173affbd666c'
            '621ee9716135685cfee32fc5f643f64cc83efdfbfdd7aac3466eb479fd36021e')
backup=("etc/conf.d/${pkgname}"
	"etc/${pkgname}/config.yaml")

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
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" BUILDTAGS="no_otel" \
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X ${_uri}/${pkgname}/internal/version.Version=${pkgver} \
    -X ${_uri}/${pkgname}/internal/version.Commit=$(git rev-parse HEAD) \
    -X ${_uri}/${pkgname}/internal/version.Date=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  go test -x ./...
}


package() {
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgname}/LICENSE.txt" -t \
"${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "${GOPATH}/src/${_uri}/${pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${GOPATH}/src/${_uri}/${pkgname}/config.example.yaml" \
"${pkgdir}/etc/${pkgname}/config.yaml"
  install -Dm0644 "${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
