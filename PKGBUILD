# Contributor: Gabriel Núñez Yuvé <gnuy@pm.me>

pkgname=subdivx-get-git
license=('MIT')
pkgdesc="Download subtitles from subdivx"
pkgver=r85.6fc1e4e
pkgrel=1
arch=('x86_64')
url='https://github.com/gnuy/subdivx-get'
source=("git+$url")
makedepends=('go' 'git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" .
}

package() {
  install -Dm755 'subdivx-get/subdivx-get' -t "$pkgdir/usr/bin"
}
