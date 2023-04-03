# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>

_pkgname=cni-plugins
pkgname=cni-plugins-nftables
pkgver=1.0.12
pkgrel=1
pkgdesc='CNI plugins compatible with nftables'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/greenpau/cni-plugins"
license=('apache')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
optdepends=(
    "cni-plugins: Other network plugins maintained by the CNI team"
)
sha256sums=('51c4b41c61f46c7dfc691d52dba301e7d8189589e1a625772f761ea3ae804fb3')

prepare(){
  cd "${_pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/cni-nftables-portmap
  go build -o build ./cmd/cni-nftables-firewall
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -dm755 "$pkgdir/usr/lib/cni"
  install -dm755 "$pkgdir/opt/cni/bin"
  install -Dm755 build/cni-nftables-portmap  "$pkgdir"/usr/lib/cni/cni-nftables-portmap
  install -Dm755 build/cni-nftables-firewall "$pkgdir"/usr/lib/cni/cni-nftables-firewall
  install -Dm755 build/cni-nftables-portmap  "$pkgdir"/opt/cni/bin/cni-nftables-portmap
  install -Dm755 build/cni-nftables-firewall "$pkgdir"/opt/cni/bin/cni-nftables-firewall
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
