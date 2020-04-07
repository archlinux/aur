# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=f4go-git
_pkgname=f4go
pkgver=r587.b8b6202
pkgrel=1
pkgdesc="Transpiling fortran code to golang code"
arch=('x86_64')
url='https://github.com/Konstantin8105/f4go'
license=('MIT')
provides=('f4go')
makedepends=('git' 'go')
source=("git+${url}")
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
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "../${_pkgname}-bin"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 ../${_pkgname}-bin "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}