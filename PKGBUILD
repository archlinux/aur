# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=align-git
_pkgname=align
pkgver=1.1.0.r0.g3cf3157
pkgrel=1
pkgdesc="A general purpose application for aligning text"
arch=('x86_64')
url='https://github.com/Guitarbum722/align'
license=('MIT')
provides=('align')
makedepends=('git' 'go-pie')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${_pkgname}/cmd/align"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/cmd/align/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}