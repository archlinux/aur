# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=bluetuith-git
pkgver=0.1.7.r1.ga088dae
pkgrel=1
pkgdesc="TUI bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/darkhz/bluetuith"
license=('MIT')
makedepends=('git' 'go')
depends=('glibc' 'bluez')
provides=('bluetuith')
conflicts=('bluetuith')
source=("${pkgname}::git+https://github.com/darkhz/bluetuith")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    .
}

check() {
  cd "$srcdir/$pkgname"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "build/bluetuith" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
