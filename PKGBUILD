# Maintainer: agony <27015 at riseup dot net>

pkgname=mp4ff
pkgver=0.61.0
pkgrel=1
pkgdesc='Tools for parsing and manipulating MP4/ISOBMFF files'
arch=('x86_64' 'aarch64')
url='https://github.com/Eyevinn/mp4ff'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('c37d251eaf8269100e4c85a22a14c34a507c6f4ac56dcf6249e6209938274f25')

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  # Go stamps the version from the git tag; an untracked file in the clone adds +dirty
  go build -v -ldflags=-linkmode=external -o "${srcdir}/build/" ./cmd/...
}

check() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  install -Dm755 "${srcdir}"/build/* -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
