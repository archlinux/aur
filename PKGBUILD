# Maintainer: Nebu Pookins <nebupookins@gmail.com>
pkgname=quire
pkgver=0.1.0
pkgrel=1
pkgdesc="Desktop document scanning application — scan, crop, export JPEG"
arch=('x86_64')
url="https://github.com/NebuPookins/quire"
license=('MIT')
depends=('libglvnd' 'libx11' 'sane')
makedepends=('go' 'inkscape')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('804420389bf7b04722a44afbab9dbe2ecf3fa2cbec5e62758f270777b39e9b47')

prepare() {
  export GOPATH="$srcdir/go"
  export GOFLAGS="-modcacherw"
  # Install the fyne bundling tool into the local GOPATH.
  go install fyne.io/fyne/v2/cmd/fyne@v2.7.3
}

build() {
  cd "$pkgname-$pkgver"
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
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
