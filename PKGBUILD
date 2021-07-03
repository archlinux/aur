# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  <philipp.classen@posteo.de>

pkgname=verifpal
pkgver=0.25.0
pkgrel=1
pkgdesc="Cryptographic protocol analysis for students and engineers."
arch=('x86_64')
url="https://verifpal.com/"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("https://source.symbolic.software/verifpal/verifpal/-/archive/v${pkgver}/verifpal-v${pkgver}.tar.bz2")
sha256sums=('46109a6e9f7e2e25ac594542f0ce79aecce1704cd9874a5fe7e8cb5f4df5783e')

prepare() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-v$pkgver"
  make dep
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$pkgname-v$pkgver"
  ## godawful hack to make building work
  PATH=$PATH:$(go env GOPATH)/bin
  make linux
}

check() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$pkgname-v$pkgver"
  make test
}

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 build/linux/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
