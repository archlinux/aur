# Maintainer: agony <27015 at riseup dot net>

pkgname=mp4ff-git
pkgver=r1293.cbcc7ab
pkgrel=1
pkgdesc='Tools for parsing and manipulating MP4/ISOBMFF files (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/Eyevinn/mp4ff'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('mp4ff')
conflicts=('mp4ff')
source=("mp4ff::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mp4ff
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd mp4ff
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd mp4ff
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  # Go stamps a pseudo-version from the last tag; an untracked file in the clone adds +dirty
  go build -v -ldflags=-linkmode=external -o "${srcdir}/build/" ./cmd/...
}

check() {
  cd mp4ff
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
}

package() {
  install -Dm755 "${srcdir}"/build/* -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/mp4ff/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
