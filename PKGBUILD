# Maintainer: raininja < dandenkijin 'at' gmail 'dot' com >
pkgname=daytona
pkgver=0.50.0
pkgrel=2
pkgdesc="The Open Source Dev Environment Manager."
arch=('x86_64')
url="https://www.daytona.io/"
license=('Apache')
optdepends=('docker')
makedepends=('go')
provides=('daytona')
source=("daytona-v${pkgver}.zip::https://github.com/daytonaio/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('f2459c43e020c879cda6d9a287e4bd8fc3a3080c39d0586de497f5d2a34ffa7c')

prepare() {
  cd "${pkgname}-${pkgver}/"
  mkdir build
  # cd build
  # go mod download -x
}

build() {
  echo "Building Daytona!"
  cd "${pkgname}-${pkgver}/build/"
  # NOTE: the BUILDTAGS may change over time
  export BUILDTAGS='seccomp systemd'
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie"
  export GOPATH="${srcdir}"
  export EXT_LDFLAGS="-linkmode external"
  export GOFLAGS="-buildmode=pie -trimpath"

  go build ../cmd/daytona
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/daytona "${pkgdir}/usr/bin/daytona"
}
