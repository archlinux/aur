# Contributor: raininja < dandenkijin at gmail dot com >
# Maintainer: raininja < dandenkijin at gmail dot com >

pkgname=clipse
pkgver=1.2.1
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix, built for wayland."
arch=('any')
url="https://github.com/savedra1/clipse"
license=('GPL-3.0-or-later')
makedepends=(
  'go'
)
optdepends=(
  'wl-clipboard'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec906744103a611cc1045a9d65f20b13b454ee046fd979abf1341a1b78fe553e')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  go mod tidy
  #make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" wayland
  go build -tags wayland -o $pkgname ${GOFLAGS[@]}
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

}
