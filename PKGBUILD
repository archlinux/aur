# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=nzb-monkey-go-git
pkgver=0.1.19.r1.gd5fc33a
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-bin" "nzb-monkey-go")

source=(
    "git+$url.git#branch=main"
    "com.github.tensai75.nzb-monkey-go.desktop"
)
sha256sums=(
    'SKIP'
    'dbf841f7241af6719283123df580f798f7bb27a8f26a28b3af1f64ed7e50a395'
)

pkgver() {
  cd "$srcdir/nzb-monkey-go"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/nzb-monkey-go"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  install -Dm755 "$srcdir/nzb-monkey-go/nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
  install -Dm644 "$srcdir/com.github.tensai75.nzb-monkey-go.desktop" \
      "$pkgdir/usr/share/applications/com.github.tensai75.nzb-monkey-go.desktop"
}
