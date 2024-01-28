# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-git'
_pkgname="${pkgname%-git}"
pkgver=v4.14.2.r31.g4eab81a9
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go (master branch / unstable)'
url='https://go-acme.github.io/lego/'
arch=('x86_64' 'i686')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")

_url='https://github.com/go-acme/lego'

depends=()
# makedepends=('git' 'make')
makedepends=('git' 'make' 'go>=1.14')

source=("git+${_url}.git")
sha512sums=('SKIP')

prepare() {
  # setup env variables & dirs
  mkdir -p "${srcdir}/go"
  export GOPATH="${srcdir}/go"
  export GO111MODULE=on

  cd "${srcdir}/${_pkgname}"
  
  # download dependencies
  go mod download
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  make build

  go clean -modcache
}

package() {
  # Bin
  install -Dm755  "${srcdir}/${_pkgname}/dist/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # License
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
