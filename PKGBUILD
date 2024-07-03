# Contributor: raininja < dandenkijin at gmail dot com >
# Maintainer: raininja < dandenkijin at gmail dot com >

pkgname=clipse
pkgver=1.0.0
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix."
arch=('any')
url="https://github.com/savedra1/clipse"
license=('GPL-3.0-or-later')
makedepends=(
  'go'
)
optdepends=(
  'xclip'
  'wl-clipboard'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de6afb2fed2c0872bd2d08449432a91e13456aa27c5329fa7e35c291608aa53a')

#prepare() {
#  cd "$pkgname-$pkgver"
#  mkdir -p build/
#}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  # export GOFLAGS="${GOFLAGS} $(pacman -T 'libalpm.so=14-64' > /dev/null && echo "-tags=next")"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
  #go build -o build ./cmd/...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

}
