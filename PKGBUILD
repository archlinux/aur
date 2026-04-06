# Maintainer: 0x90shell
pkgname=jstimeout-git
pkgver=r12.d40560d
pkgrel=1
pkgdesc='Auto-disconnect idle Bluetooth gamepads after a configurable timeout'
arch=('x86_64' 'aarch64')
url='https://github.com/0x90shell/jstimeout'
license=('MIT')
depends=('bluez-utils')
makedepends=('git' 'go')
provides=('jstimeout')
conflicts=('jstimeout' 'jstimeout-bin')
install=jstimeout-git.install
source=("${pkgname}::git+https://github.com/0x90shell/jstimeout.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o jstimeout jstimeout.go
}

package() {
  cd "$pkgname"
  install -Dm755 jstimeout "$pkgdir/usr/bin/jstimeout"
  install -Dm644 .jstimeout.devices "$pkgdir/usr/share/jstimeout/devices.example"
  install -Dm644 jstimeout.service "$pkgdir/usr/share/jstimeout/jstimeout.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/jstimeout/README.md"
}
