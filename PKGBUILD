# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=cni-plugins-nftables
pkgname="${_pkgname}-git"
pkgver=v1.0.9.r0.ge25d348
pkgrel=1
pkgdesc='CNI plugins compatible with nftables'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/greenpau/cni-plugins"
license=('apache')
makedepends=('go')
source=("${_pkgname}::git+https://github.com/greenpau/cni-plugins.git")
conflicts=("${_pkgname}")
optdepends=(
    "cni-plugins: Other network plugins maintained by the CNI team"
)
provides=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/cni-nftables-portmap
  go build -o build ./cmd/cni-nftables-firewall
}

package() {
  cd "$_pkgname"
  install -dm755 "$pkgdir/usr/lib/cni"
  install -dm755 "$pkgdir/opt/cni/bin"
  install -Dm755 build/cni-nftables-portmap  "$pkgdir"/usr/lib/cni/cni-nftables-portmap
  install -Dm755 build/cni-nftables-firewall "$pkgdir"/usr/lib/cni/cni-nftables-firewall
  install -Dm755 build/cni-nftables-portmap  "$pkgdir"/opt/cni/bin/cni-nftables-portmap
  install -Dm755 build/cni-nftables-firewall "$pkgdir"/opt/cni/bin/cni-nftables-firewall
}
