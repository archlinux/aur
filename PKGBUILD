# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgbase=aranet4-git
_pkgbase=aranet4
pkgname=(aranet4-ls-git aranet4-srv-git)
pkgver=0.7.0.r2.g17b513d
pkgrel=1
pkgdesc="Driver and utilities for the Aranet4 air quality monitor (latest git version)"
arch=('x86_64')
url="https://git.sr.ht/~sbinet/aranet4"
options=(!lto)
license=('MIT')
makedepends=('go>=1.19')
depends=('bluez')
source=("${_pkgbase}::git+https://git.sr.ht/~sbinet/${_pkgbase}")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=0

  cd "${srcdir}/${_pkgbase}"
  go build -o aranet4-ls ./cmd/aranet4-ls 
  go build -o aranet4-srv ./cmd/aranet4-srv 
}

package_aranet4-ls-git() {
  _pkgname=aranet4-ls
  pkgdesc='Command line utility for the Aranet4 air quality monitor (latest git version)'
  conflicts=(${_pkgname})
  provides=(${_pkgname})

  install -d "${pkgdir}"/usr/bin
  install -D -m755 "${srcdir}"/${_pkgbase}/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}

package_aranet4-srv-git() {
  _pkgname=aranet4-srv
  pkgdesc='Simple HTTP server that plots the full history of data samples from an Aranet4 air quality monitor (latest git version)'
  conflicts=(${_pkgname})
  provides=(${_pkgname})

  install -d "${pkgdir}"/usr/bin
  install -D -m755 "${srcdir}"/${_pkgbase}/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
