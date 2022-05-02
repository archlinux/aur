# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=doctree
pkgver=r68.ef758de
pkgrel=1
pkgdesc='First-class library docs tool for every language'
arch=('x86_64')
url='https://github.com/sourcegraph/doctree'
license=('Apache')
depends=('glibc')
makedepends=(
  'git'
  'go'
  'nodejs'
  'npm'
  'go-task'
)
options=('!lto')
_commit='ef758de81dff2c6e5767bb2721c19b22b6dde876'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$pkgname"

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # generate frontend and compile binary
  go-task \
    install-frontend-deps \
    build
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" ./.bin/doctree
}
