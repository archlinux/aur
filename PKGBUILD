# Maintainer: youcef < youcef.nafa 'at' gmail 'dot' com >
# ex-Maintainer: raininja < dandenkijin 'at' gmail 'dot' com >
pkgname=daytona
pkgver=0.190.0
pkgrel=1
pkgdesc="The Open Source Dev Environment Manager."
arch=('x86_64')
url="https://www.daytona.io/"
license=('Apache')
optdepends=('docker')
makedepends=('go')
provides=('daytona')
source=("daytona-v${pkgver}.zip::https://github.com/daytonaio/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('29e65678f4db9ad7dc0fda8fd3316b5bfd54f9b240b6d911d23aaae5084d5319')

prepare() {
  cd "${pkgname}-${pkgver}/"
  if [ ! -d build]; then 
    mkdir build
  fi
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

  go build ../apps/cli/cmd
  go build ../apps/proxy/cmd/proxy
  go build ../apps/runner/cmd/runner
  go build ../apps/ssh-gateway
  go build ../apps/daemon/cmd/daemon
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/cli "${pkgdir}/usr/bin/daytona"
  install -Dm755 build/runner "${pkgdir}/usr/bin/daytona-runner"
  install -Dm755 build/proxy "${pkgdir}/usr/bin/daytona-proxy"
  install -Dm755 build/ssh-gateway "${pkgdir}/usr/bin/daytona-ssh-gateway"
  install -Dm755 build/daemon "${pkgdir}/usr/bin/daytona-daemon"




}
