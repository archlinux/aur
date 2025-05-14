# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="aws-nuke"
pkgver=3.53.0
pkgrel=1
pkgdesc="Remove all the resources from an AWS account"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://aws-nuke.ekristen.dev"
_url="https://github.com/ekristen/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('de9033b31f767f3794f0fdc9ed8a799917f7569859a0ede62fbf2ff569ad6d8683115694079f17a6e5a0ba5355ee8350068695c985fd142f37116e2bbf2cb530')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 644 {} +

  mkdir -p "build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  # $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${_url#https://}/pkg/common.SUMMARY=v${pkgver} \
    -X ${_url#https://}/pkg/common.BRANCH=main \
    -X ${_url#https://}/pkg/common.VERSION=$(git describe --tags --abbrev=0 2>/dev/null || echo "v${pkgver}") \
    -X ${_url#https://}/pkg/common.COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "unknown")" \
    .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
