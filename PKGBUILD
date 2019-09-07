# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='godownloader-git'
_pkgname="${pkgname%-git}"
pkgver=r303.93b2b79
pkgrel=1
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
