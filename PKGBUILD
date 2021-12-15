# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=lokoctl
_distribution=lokomotive
pkgdesc='A tool for managing Lokomotive clusters, components and updates.'
arch=(x86_64)
url='https://kinvolk.io/lokomotive-kubernetes/'
_url='https://github.com/kinvolk/lokomotive'
pkgver=0.9.0
pkgrel=1
license=('APACHE')
makedepends=(go)
source=("${_distribution}-${pkgver}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3b3e107a4184912c019023a8f3179b51a4bfd898a837cf5ceb216bd239bbc74d56ae9db0039419646c1b8aa4be3556be73cdd2a5fe136431860bcef6ffb823c5')
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
