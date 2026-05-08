# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='openvpn-auth-oauth2'
pkgver='1.27.4'
pkgrel='1'
pkgdesc='A Plugin/management interface client for OpenVPN server to handle an OIDC based single sign-on (SSO) auth flows'
arch=('x86_64' 'aarch64')
_uri="github.com/jkroepke"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go')
depends=('openvpn>=2.6.2')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('314b449d5b1283ee1f01b48163a4714444b795c5a77654314b9f9c9f4bc9d3ec')
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

  sed -i \
    -e 's|/etc/sysconfig|/etc/conf.d|g' \
    -e 's|CapabilityBoundingSet=|CapabilityBoundingSet=CAP_NET_BIND_SERVICE|g' \
    -e 's|AmbientCapabilities=|AmbientCapabilities=CAP_NET_BIND_SERVICE|g' \
    -e '/PrivateUsers=true/d' \
"${pkgname}-${pkgver}/packaging/usr/lib/systemd/system/${pkgname}.service"

}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" BUILDTAGS="no_otel"

  for e in "cmd" "lib"
    do

      if [[ "${e}" == "lib" ]]
        then
          mode="c-shared"
          outname="${pkgname}.so"
      else
          mode="pie"
          outname="${pkgname}"
      fi

      go build -x \
        -buildmode="${mode}" \
        -trimpath \
        -mod="readonly" \
        -modcacherw \
        -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
        -X ${_uri}/${pkgname}/internal/version.Version=${pkgver} \
        -X ${_uri}/${pkgname}/internal/version.Commit=$(git rev-parse HEAD) \
        -X ${_uri}/${pkgname}/internal/version.Date=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})" \
        -o "${outname}" \
        "./${e}/${pkgname}"
    done
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  go test -modcacherw -race ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0755 "${pkgname}.so" -t "${pkgdir}/usr/lib/openvpn/plugins"
  install -Dm0644 "${pkgname}.h" -t "${pkgdir}/usr/include"

  pushd "packaging"
  install -Dm0644 "etc/${pkgname}/config.yaml" -t "${pkgdir}/etc/${pkgname}"
  install -Dm0644 "etc/sysconfig/${pkgname}" -t "${pkgdir}/etc/conf.d"
  install -Dm0644 "usr/lib/systemd/system/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "usr/lib/sysusers.d/${pkgname}.conf" -t "${pkgdir}/usr/lib/sysusers.d"
}
