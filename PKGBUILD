# Maintainer: Andres <andresdortiz@gmail.com>
pkgname=dreamdump-git
pkgver=0.6.0.r2.g742d0ef
pkgrel=1
pkgdesc='Dump Sega Dreamcast GD-ROM discs'
arch=('i686' 'x86_64' 'aarch64')
url='https://codeberg.org/MoriGM/dreamdump'
license=('EPL-2.0')
depends=('glibc')
makedepends=('git' 'go>=1.26')
provides=('dreamdump')
conflicts=('dreamdump' 'dreamdump-bin')
options=('!lto' '!debug')
source=('dreamdump::git+https://codeberg.org/MoriGM/dreamdump.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd dreamdump
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  cd dreamdump
  _set_go_env
  go mod download -modcacherw
}

build() {
  cd dreamdump
  _set_go_env
  # main.VERSION is a const, so the linker cannot replace it.
  go build -o dreamdump .
}

check() {
  cd dreamdump
  _set_go_env
  go test ./...
}

package() {
  cd dreamdump
  install -Dm755 dreamdump "$pkgdir/usr/bin/dreamdump"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 DRIVES.csv "$pkgdir/usr/share/doc/$pkgname/DRIVES.csv"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
