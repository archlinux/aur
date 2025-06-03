# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>

pkgname=schedctl
pkgver=1.0.0
pkgrel=2
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
sha256sums=('b0b20262424dc9a9b415574502d102fefd11ff954fe5b9baed31c3ed1ff111c8')

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
