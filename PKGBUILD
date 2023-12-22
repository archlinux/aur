# Maintainer: Matthew Sexton <mssxtn@gmail.com>
pkgname=ftcat-git
_pkgname=${pkgname%-git}
pkgver=0.1.r28.g88001a6
pkgrel=1
pkgdesc='Markdown/reStructuredText live previewer'
arch=('x86_64')
url="https://github.com/hhatto/ftcat"
license=('MIT')
makedepends=('go')
source=("git+https://github.com/hhatto/ftcat.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^ver//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_pkgname}"
  mkdir -p build/
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd "${_pkgname}"
  install -Dm755 build/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
}
