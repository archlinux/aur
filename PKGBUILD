# Maintainer: YangKeao <yangkeao@chunibyo.icu>

pkgbase=chaos-driver
pkgname=(chaos-driver-dkms kchaos)
pkgver=0.1.0
pkgrel=2
pkgdesc="A kernel module to inject error or latency inside the linux kernel"
arch=('i686' 'x86_64')
url="https://github.com/chaos-mesh/chaos-driver"
license=('GPL2' 'Apache')
makedepends=('go')
depends=('dkms')
conflicts=("${pkgbase}")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6460c49b6b51dae747717e262e0aa01e85e7d4883dff5f2063dc0610ad6a164')

package_chaos-driver-dkms() {
  cd ${pkgbase}-${pkgver}/driver

  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/dkms.conf

  cp -r * "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/
}

prepare() {
  cd ${pkgbase}-${pkgver}
  mkdir -p build
}

build() {
  cd ${pkgbase}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/kchaos ./cmd/...
}

package_kchaos() {
  cd ${pkgbase}-${pkgver}
  install -Dm755 build/kchaos "$pkgdir"/usr/bin/kchaos
}
