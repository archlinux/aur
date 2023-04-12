# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

_pkgname=nomad-driver-podman
pkgname=${_pkgname}-git
pkgver=0.4.2.r10.gaeed282
pkgrel=1
pkgdesc="A nomad taskdriver for podman containers"
arch=('x86_64')
url="https://github.com/hashicorp/nomad-driver-podman"
license=('MPL2')
depends=('nomad' 'podman')
makedepends=('go' 'git')
options=('!lto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags --match'=v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "${_pkgname}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode=external -compressdwarf=false -extldflags ${LDFLAGS}" \
    -o build \
    .
}

package() {
  cd "${_pkgname}"

  # binary
  install -vDm755 -t "$pkgdir/usr/lib/nomad/plugins" "build/${_pkgname}"

  # documentation
  rm "examples/plugins/.gitkeep"
  rmdir "examples/plugins"
  install -vDm644 -t "$pkgdir/usr/share/doc/${_pkgname}" README.md
  cp -vr examples "$pkgdir/usr/share/doc/${_pkgname}"
}
