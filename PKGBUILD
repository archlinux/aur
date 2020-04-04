# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=apicompat-git
_pkgname=apicompat
pkgver=r125.5f916b1
pkgrel=2
pkgdesc="Checks recent changes to a Go project for backwards incompatible changes"
arch=('x86_64')
url='https://abicheck.bradleyf.id.au'
license=('MIT')
provides=('apicompat')
makedepends=('git' 'go')
source=("git+https://github.com/bradleyfalzon/apicompat")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
   ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
  
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${_pkgname}/cmd/apicompat"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "${srcdir}/${_pkgname}-bin"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 ../${_pkgname}-bin "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}