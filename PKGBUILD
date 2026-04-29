# Maintainer: Caian Keller <dev@caiankeller.com>
pkgname=golauncher-git
pkgver=0.1.0.r0.gc450ffa
pkgrel=1
pkgdesc="A minimalist TUI application launcher for Arch Linux (Latest Git)"
arch=('x86_64') # i can't test on other architectures, but it should work on all of them
url="https://github.com/caiankeller/golauncher"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('golauncher')
conflicts=('golauncher')

source=('golauncher::git+https://github.com/caiankeller/golauncher.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/golauncher"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "golauncher"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o golauncher .
}

package() {
  cd "$srcdir/golauncher"
  install -Dm755 golauncher "$pkgdir/usr/bin/golauncher"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
