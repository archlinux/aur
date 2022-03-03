# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="podman-tui-git"
_pkgname="podman-tui"
pkgver=0.1.0.r0.g3b1f222
pkgrel=2
pkgdesc="Podman Terminal User Interface"
arch=('x86_64')
url="https://github.com/containers/podman-tui"
license=('APACHE')
makedepends=('go>=1.17' 'make')
conflicts=('podman-tui')
provides=('podman-tui')
source=("podman-tui::git+https://github.com/containers/podman-tui.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir/usr/bin" binary
}

package() {
  depends=('podman>3')
  cd "$srcdir/$_pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir/usr/bin" install
}
