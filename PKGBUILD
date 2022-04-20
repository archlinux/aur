# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dagger
pkgver=0.2.7
pkgrel=1
pkgdesc="A portable devkit for CI/CD pipelines"
arch=('x86_64')
url="https://dagger.io"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='18c19174a2a892ff3157a4a3a8bb06ab6dcb50fe'
source=("$pkgname::git+https://github.com/dagger/dagger.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags $LDFLAGS \
    -X go.dagger.io/dagger/version.Revision=$_commit \
    -X go.dagger.io/dagger/version.Version=$pkgver" \
    -o build \
    ./cmd/...
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" build/dagger
}
