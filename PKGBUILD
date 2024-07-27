# Maintainer:  Nicholas Wang <me#nicho1as.wang>

pkgname=tunasync-git
pkgver=20240403.r476.938f67c
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA"
url="https://github.com/tuna/tunasync"
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
replaces=('tunasync-bin')
conflicts=('tunasync-bin')
provides=('tunasync' 'tunasynctl')
source=('tunasync::git+https://github.com/tuna/tunasync#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/tunasync
  printf "%s.r%s.%s" "$(git log -1 --format="%cd" --date=short | sed 's/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}"/tunasync
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie"
  export GOPATH="${srcdir}"
  make
}

package() {
  install -Dm755 "${srcdir}"/tunasync/build-linux-amd64/tunasync "${pkgdir}"/usr/bin/tunasync
  install -Dm755 "${srcdir}"/tunasync/build-linux-amd64/tunasynctl "${pkgdir}"/usr/bin/tunasynctl
}
