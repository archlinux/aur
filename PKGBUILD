# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='godownloader-git'
_pkgname="${pkgname%-git}"
pkgver=r302.7d30e44
pkgrel=2
pkgdesc='Download Go binaries as fast and easily as possible.'
url='https://install.goreleaser.com/'
arch=('x86_64' 'i686')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname}")

_url='https://github.com/goreleaser/godownloader'
_goreleaserpath=github.com/goreleaser
_godownloaderpath="${_goreleaserpath}/godownloader"

depends=()
# makedepends=('git')
makedepends=('git' 'go>=1.11')

source=("git+${_url}.git")
sha512sums=('SKIP')

prepare() {
  # setup env variables & dirs
  mkdir -p "${srcdir}/go"
  export GOPROXY=https://proxy.golang.org
  export GOPATH="${srcdir}/go"
  export GO111MODULE=on

  cd "${srcdir}/${_pkgname}"
  
  # fix regression from https://github.com/goreleaser/godownloader/pull/131
  sed '/git.apache.org/d' go.mod > go.mod.tmp
  mv go.mod.tmp go.mod

  # Waiting for the merge of https://github.com/goreleaser/godownloader/pull/132
  echo '// related to an invalid pseudo version in code.gitea.io/gitea v1.10.0-dev.0.20190711052757-a0820e09fbf7' >> go.mod
  echo 'replace github.com/go-macaron/cors => github.com/go-macaron/cors v0.0.0-20190418220122-6fd6a9bfe14e' >> go.mod
  echo '// related to an invalid pseudo version in contrib.go.opencensus.io/exporter/ocagent@v0.4.2' >> go.mod
  echo 'replace github.com/census-instrumentation/opencensus-proto => github.com/census-instrumentation/opencensus-proto v0.0.3-0.20181214143942-ba49f56771b8' >> go.mod

  # download dependencies
  go mod download
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" .
}

package() {
  # Bin
  install -Dm755  "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # License
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
