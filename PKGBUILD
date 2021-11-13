# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: atemu

pkgname=yup-git
pkgver=1.1.7.r3.g2efd810
pkgrel=1
pkgdesc="Ncurses based AUR Helper with improved searching and sorting"
arch=('x86_64' 'aarch64')
url="https://github.com/ericm/yup"
license=('GPL3')
depends=('pacman>=5.1' 'ncurses')
makedepends=('git' 'go')
optdepends=('sudo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ericm/yup.git')
sha256sums=('SKIP')

prepare() {
  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make

  # Clean mod cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX="$pkgdir/usr" install
}
