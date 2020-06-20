# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=align-git
_pkgname=align
pkgver=1.1.0.r0.g3cf3157
pkgrel=2
pkgdesc="A general purpose application for aligning text"
arch=('x86_64')
url='https://github.com/Guitarbum722/align'
license=('MIT')
provides=('align')
depends=('glibc')
makedepends=('git' 'go')
source=("align::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 build/align "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}