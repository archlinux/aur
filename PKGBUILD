# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=waypoint
pkgver=0.10.5
pkgrel=1
pkgdesc='A tool to build, deploy, and release any application on any platform'
arch=('x86_64')
url='https://www.waypointproject.io/'
license=('MPL2')
makedepends=('git' 'go' 'go-bindata')
optdepends=('docker: for local development server')
options=('!lto')
_commit='ece0f754160d7f394465b677702688d704c2588c'
source=("$pkgname::git+https://github.com/hashicorp/waypoint.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  go mod download
}

build() {
  # set Go flags
  local GIT_IMPORT="github.com/hashicorp/waypoint/internal/version"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie \
    -trimpath \
    -ldflags=-linkmode=external \
    -ldflags=-X=${GIT_IMPORT}.GitCommit=$_commit \
    -ldflags=-X=${GIT_IMPORT}.GitDescribe=$pkgver \
    -mod=readonly \
    -modcacherw"

  # build process extracted from Makefile
  cd "$pkgname"
  go build -v \
    -o ./internal/assets/ceb/ceb \
    ./cmd/waypoint-entrypoint

  pushd internal/assets
  go-bindata \
    -verbose \
    -pkg assets \
    -o prod.go \
    -tags assetsembedded \
    ./ceb
  popd

  go build -v \
    -tags assetsembedded \
    -o ./waypoint \
    ./cmd/waypoint
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr contrib/serverinstall/kind-k8s "$pkgdir/usr/share/doc/$pkgname"
  rm -vf "$pkgdir/usr/share/doc/$pkgname/.gitignore"
}
