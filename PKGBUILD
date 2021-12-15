# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=lokoctl
_distribution=lokomotive
pkgdesc='A tool for managing Lokomotive clusters, components and updates.'
arch=(x86_64)
url='https://kinvolk.io/lokomotive-kubernetes/'
_url='https://github.com/kinvolk/lokomotive'
pkgver=0.7.0
pkgrel=1
license=('APACHE')
makedepends=(go)
source=("${_distribution}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c506402bc0426295c528fc58558830f10a05b55189c049990f3fa659df48d63f')
sha512sums=('ddf7324ab3fa6029ca4354980a5d15fe6e373bafcb6b50dbb57e5e89b35206f702c501e78d7c000cb006c13863af3364f3547947b41732c18486ce72b315efd7')
b2sums=('90d23ce061d9fdbcd6b0825327af337ae2fef2b61819952f3010badf36966c3a74be7de250bbe49bafb35639b5a14e86802ff1d67a18b8fa59e6f20cf6fbaa8b')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "${_distribution}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build ./cmd/lokoctl
}

check() {
  cd "${_distribution}-${pkgver}"
  go test ./...
}

package() {
  cd "${_distribution}-${pkgver}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
