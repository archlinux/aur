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
sha256sums=('2a5ee217bf1c80b4b05599988ec71ab54126f9d7b0e4e2074f789a040f7e216f')
sha512sums=('75606b52198fb14efeffbd7582e6d4ee25f2c4ca0165421944a467c3447dc6b3c586c90968581d242011a04f767776ebece18a6a90031b63e5d06081fabbebcb')
b2sums=('5187f069264292a1ea48e44f77cd080eb013c33ec0d60253fa3e30732ef7e8849c364813e0405bd7bdab5c5f96ba1a8618f62beb8199ca15eed3473c4fde8c3d')
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
