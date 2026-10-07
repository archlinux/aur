# Maintainer: Swaranga Sarma <sarma.swaranga@gmail.com>
pkgname=dloom
pkgver=1.0.3
pkgrel=1
pkgdesc='Flexible dotfile symlink manager and system bootstrapper'
arch=('x86_64')
url='https://github.com/dloomorg/dloom'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dloomorg/dloom/archive/refs/tags/v1.0.3.tar.gz")
sha256sums=('75035d1f5eb1de02a8242fc7a259099be47ac8703a654a11c9b6ce4d3131c2e5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go build \
    -ldflags "-linkmode external -X github.com/dloomorg/dloom/cmd.Version=${pkgver}" \
    -o "${pkgname}" \
    .
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
