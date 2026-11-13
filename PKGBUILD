# Maintainer: agony <27015 at riseup dot net>

pkgname=mp4ff
pkgver=0.63.0
pkgrel=1
pkgdesc='Tools for parsing and manipulating MP4/ISOBMFF files'
arch=('x86_64' 'aarch64')
url='https://github.com/Eyevinn/mp4ff'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('73f89dc9ba580227eba4a572b51396ed022abdcf907fa8f4b93536871a31592e')

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
  install -Dm644 "${srcdir}/${pkgname}/bits/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/bits"
  install -Dm644 "${srcdir}/${pkgname}/mp4/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/mp4"
}
