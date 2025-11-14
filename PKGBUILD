# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>

pkgname=schedctl
pkgver=1.0.2
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
sha256sums=('4370500384120ad270ba99da5fa29a47954b83832a27476e9124b9757465a70a')

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
}
