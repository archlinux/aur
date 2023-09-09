# Maintainer: Liganic <liganic-aur at gmx dot org>
pkgname=bluewalker-git
_pkgname=${pkgname%-git}
pkgver=r221.713a3fd
pkgrel=1
pkgdesc="Bluewalker is a proof-of-concept Bluetooth LE scanner and advertiser which uses HCI user channel raw HCI sockets."
arch=('x86_64')
url="https://gitlab.com/jtaimisto/bluewalker/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
source=('git+https://gitlab.com/jtaimisto/bluewalker.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  mkdir -p build/
}

build() {
  cd "$srcdir/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$srcdir/${_pkgname}"
  go test ./...
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

