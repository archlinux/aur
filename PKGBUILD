# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>

pkgname=schedctl
pkgver=1.3.0
pkgrel=1
pkgdesc='eBPF sched_ext plug and play schedulers for fun and profit'
arch=('x86_64' 'aarch64')
url='https://github.com/schedkit/schedctl'
license=('Apache-2.0')
makedepends=(
  'go'
  'btrfs-progs'
  'gpgme'
)
optdepends=(
  'podman: podman container runtime'
  'containerd: containerd container runtime'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/schedkit/schedctl/archive/v${pkgver}.tar.gz")
sha256sums=('182e10e6d2c70b5f664e648cdde03a6bb813031ac05829a5a7ebf82fdd49f749')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags="-s -X main.version=${pkgver}-arch" -o build/schedctl ./main.go
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755  build/schedctl "$pkgdir"/usr/bin/$pkgname

  local usrshare="${pkgdir}/usr/share"
  install -Dm644 -t "${usrshare}/licenses/${pkgname}/" LICENSE

  install -Dm644 -t "${usrshare}/man/man1/" dist/man/*.1
}
