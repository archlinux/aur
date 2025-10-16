# Maintainer: Benjamin Chausse <benjamin@chausse.xyz>

pkgname=termpicker-git
pkgver=v1.5.0
pkgrel=1
pkgdesc="A color picker for the terminal"
arch=('x86_64')
url="https://github.com/ChausseBenjamin/termpicker"
license=('Beerware')
options=('!debug')
depends=()
makedepends=('git' 'go' 'upx')
optdepends=(
  'wl-clipboard: clipboard support on wayland'
  'xsel: clipboard support on X11'
)
provides=('termpicker')
conflicts=('termpicker' 'termpicker-bin')
source=("${pkgname}::git+https://github.com/ChausseBenjamin/termpicker.git#tag=v1.5.0")
sha256sums=('SKIP')



build() {
  cd "$srcdir/${pkgname}"
  commit_hash=$(git rev-parse --short HEAD)
  export GOAMD64=v3
  export CGO_ENABLED=0
  go generate ./...
  go build -trimpath -ldflags "-s -w -X main.version=${pkgver}-git" -o termpicker .
  upx -9 termpicker
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 termpicker "${pkgdir}/usr/bin/termpicker"
  install -Dm644 internal/documentation/termpicker.1 "${pkgdir}/usr/share/man/man1/termpicker.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
