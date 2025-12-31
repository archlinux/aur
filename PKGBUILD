# Contributor: raininja < dandenkijin at gmail dot com >
# Maintainer: raininja < dandenkijin at gmail dot com >

pkgname=clipse-x11
_pkgname=clipse
pkgver=1.2.0
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix, built for X11."
arch=('any')
url="https://github.com/savedra1/clipse"
license=('GPL-3.0-or-later')
makedepends=(
  'go'
)
optdepends=(
  'xclip: for clipboard integration'
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1a812f702380a835526356871c3efb2e23a76d5407b2ca3e2e23afc1adb7ee94')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$srcdir/$_pkgname-$pkgver"
  go mod tidy
  #make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" wayland
  go build -tags x11 -o $_pkgname ${GOFLAGS[@]}
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname

}
