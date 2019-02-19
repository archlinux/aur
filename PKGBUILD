# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='godownloader-git'
_pkgname="${pkgname%-git}"
pkgver=r265.de35133
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
makedepends=('git' 'go')

source=("git+${_url}.git")
sha512sums=('SKIP')

prepare() {
  # setup go env vars
  export GO111MODULE=on

  mkdir -p "${srcdir}/${_goreleaserpath}/" && cd $_
  mv ${srcdir}/${_pkgname} .
}

pkgver() {
  cd "${srcdir}/${_godownloaderpath}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_godownloaderpath}"
  go build .
}

package() {
  # Bin
  install -Dm755  "${srcdir}/${_godownloaderpath}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # License
  install -Dm644 "${srcdir}/${_godownloaderpath}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
