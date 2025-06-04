# Maintainer: Alessio Biancalana <alessio@dottorblaster.it>

pkgname=schedctl
pkgver=1.0.1
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
sha256sums=('fce43a8a7ab0baac3a87372987608abdfda3ac40ca86f9ad3c283d0dd4170b54')

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
