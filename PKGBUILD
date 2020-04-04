# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c4go-git
_pkgname=c4go
pkgver=r1591.8460ec2f
pkgrel=1
pkgdesc="Transpiling C code to Go code"
arch=('x86_64')
url='https://github.com/Konstantin8105/c4go'
license=('MIT')
provides=('c4go')
depends=('clang')
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