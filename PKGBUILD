# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: moyiz <8603313+moyiz@users.noreply.github.com>

pkgname=wander
pkgver=0.14.1
_commit=4172951d37d915e7f02b2660980130992f168e8e  # tags/v0.14.1
pkgrel=1
pkgdesc="An efficient terminal application/TUI for your HashiCorp Nomad cluster."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/robinovitch61/wander"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('wander')
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "${pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -compressdwarf=false" \
    -o build \
    .
}

package() {
  cd "${pkgname}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
