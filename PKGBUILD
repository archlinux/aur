# Maintainer: Andres <andresdortiz@gmail.com>
pkgname=dreamdump
pkgver=0.6.0
pkgrel=1
pkgdesc='Dump Sega Dreamcast GD-ROM discs'
arch=('i686' 'x86_64' 'aarch64')
url='https://codeberg.org/MoriGM/dreamdump'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26')
conflicts=('dreamdump-bin' 'dreamdump-git')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/MoriGM/dreamdump/archive/$pkgver.tar.gz")
sha256sums=('7ec6930802a6a952e45ac551f0d773c833b4524bda8b3e4168e0ede4e0226f88')

_set_go_env() {
  # go.mod pins a toolchain. Use the system Go instead of downloading one.
  export GOTOOLCHAIN=local
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
}

prepare() {
  cd "$pkgname"
  _set_go_env
  go mod download -modcacherw
}

build() {
  cd "$pkgname"
  _set_go_env
  # main.VERSION is a const, so the linker cannot replace it.
  go build -o "$pkgname" .
}

check() {
  cd "$pkgname"
  _set_go_env
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 DRIVES.csv "$pkgdir/usr/share/doc/$pkgname/DRIVES.csv"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
