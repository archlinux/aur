pkgname=nexttrace
pkgver=1.0.8
pkgrel=1
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/sjlleo/nexttrace"
license=('GPL')
makedepends=('go' 'git')
source=("git+https://github.com/sjlleo/nexttrace.git#tag=v$pkgver")
sha256sums=('SKIP')
install=nexttrace.install

build() {
  cd "$pkgname"
  export BUILD_VERSION="$(git describe --tags --always)"
  export COMMIT_SHA1="$(git rev-parse --short HEAD)"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X 'github.com/xgadget-lab/nexttrace/printer.version=${BUILD_VERSION}' -X 'github.com/xgadget-lab/nexttrace/printer.commitID=${COMMIT_SHA1}' " \
    .
}

package() {
  cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
