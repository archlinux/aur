# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="go-life"
_commit_rel="2a4783731e134164f4e0bcc07d86f46458c962c5" # 0.4.0
_commit="c22a0f1b479af8ff5568cd18d1029f65917f98c9" # r7
pkgver="0.4.0+r7+g${_commit::7}"
pkgrel=1
pkgdesc="Terminal based Conway's Game of Life. Implemented in Go."
arch=('x86_64')
url="https://github.com/sachaos/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('2f4859d038e8533843c4620895220ab8f2f5380f1343e496c0bfa4dbe06211c3')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
  go mod tidy
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
