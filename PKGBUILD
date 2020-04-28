# Maintainer: ml <ml@visu.li>
pkgname=sonobuoy
pkgver=0.18.1
pkgrel=1
pkgdesc='Diagnostic tool for Kubernetes clusters'
arch=('x86_64')
url='https://github.com/vmware-tanzu/sonobuoy'
license=('Apache')
depends=('glibc')
optdepends=(
  'docker: sonobuoy images subcommand'
  'kubectl: advances workflows')
makedepends=('go' 'gzip' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2443b098de78c457776ce6d13803547d33ffd563984a269be6d449886652592c')

build() {
  # illegal packaging technique
  _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  _defines=(
    "github.com/vmware-tanzu/sonobuoy/pkg/buildinfo.Version=v${pkgver}"
    "github.com/vmware-tanzu/sonobuoy/pkg/buildinfo.GitSHA=${_commit}"
  )
  go build -o "$pkgname" -ldflags "${_defines[*]/#/-X=}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./cmd/... ./pkg/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
