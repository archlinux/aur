# Maintainer: Edgar Vincent <e-v@posteo.net>
_pkgname=kbdaemon
pkgname=${_pkgname}-git
_name=kbd
_binary=keyboard-battery-daemon
pkgver=0.4.r3.g9f308ce
pkgrel=1
pkgdesc="Daemon which manages the Pinephone keyboard battery."
arch=('aarch64')
url="https://gitlab.com/undef1/kbd"
license=('GPL3')
depends=()
makedepends=('go')
provides=("$pkgname")
conflicts=()
source=("git+https://gitlab.com/undef1/kbd" "binpath.patch")
sha256sums=('SKIP' '66789320f73dacd12c0eeb64a7d2c6391f7dbe5f34bb70f55faaf41e2e0cba65')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_name"
    patch --forward --strip=1 --input="${srcdir}/binpath.patch"
}

build() {
  cd "$srcdir/$_name"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  GOARCH=arm64 go build
}

package() {
  cd "$srcdir/$_name"
  install -Dm755 $_binary "$pkgdir"/usr/bin/$_binary
  install -Dm0644 ${_pkgname}.service "$pkgdir"/usr/lib/systemd/system/${_pkgname}.service
}

# vim:set ts=2 sw=2 et:
