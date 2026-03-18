# Maintainer: Nebu Pookins <nebupookins@gmail.com>
pkgname=quire-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Desktop document scanning application — scan, crop, export JPEG"
arch=('x86_64')
url="https://github.com/NebuPookins/quire"
license=('MIT')
depends=('libglvnd' 'libx11' 'sane')
makedepends=('go' 'inkscape' 'git')
provides=('quire')
conflicts=('quire')
source=("$pkgname::git+https://github.com/NebuPookins/quire.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="$srcdir/go"
  # Install the fyne bundling tool into the local GOPATH.
  go install fyne.io/fyne/v2/cmd/fyne@v2.7.3
}

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/go"
  export PATH="$PATH:$GOPATH/bin"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR="$pkgdir"
}
