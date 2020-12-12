# Maintainer: ml <ml@visu.li>
pkgname=sonobuoy
pkgver=0.20.0
pkgrel=1
pkgdesc='Diagnostic tool for Kubernetes clusters'
arch=('x86_64')
url='https://github.com/vmware-tanzu/sonobuoy'
license=('Apache')
depends=('glibc')
optdepends=(
  'docker: sonobuoy images subcommand'
  'kubectl: advances workflows')
makedepends=('go' 'git')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e64f6026087277d22f1cdc52cb7ff8bfb19ca3671ea6f882c2c1327675b07b9d')

prepare() {
  cd "${pkgname}-${pkgver}"
  go get -d
}

build() {
  local _commit _defines
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -mod=readonly -trimpath'
  _defines=(
    "github.com/vmware-tanzu/sonobuoy/pkg/buildinfo.Version=v${pkgver}"
    "github.com/vmware-tanzu/sonobuoy/pkg/buildinfo.GitSHA=${_commit}"
  )
  go build -o "$pkgname" -ldflags "-linkmode=external ${_defines[*]/#/-X=}"
}

check() {
  cd "${pkgname}-${pkgver}"
  GODEBUG=x509ignoreCN=0 go test ./cmd/... ./pkg/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
