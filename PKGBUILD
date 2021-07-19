pkgname=xkcd-gtk
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple xkcd comic viewer written in Go using GTK+3."
arch=('x86_64')
url="https://github.com/rkoesters/xkcd-gtk"
license=('GPL3')
makedepends=('go')
depends=('gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('41f528a69705490cb8f53b0404d70edf628d418e69806f2685c64d573f4202b9')

prepare() {
  # Prevent creation of a `go` directory in one's home.
  # Sometimes this directory cannot be removed with even `rm -rf` unless
  # one becomes root or changes the write permissions.
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build()  {
  cd "$pkgname-$pkgver"
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
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  ln -s "/usr/bin/com.github.rkoesters.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
