pkgname=nexttrace
pkgver=1.1.7
pkgrel=1
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/sjlleo/nexttrace-core"
license=('GPL')
makedepends=('go' 'git')
source=("git+https://github.com/sjlleo/nexttrace-core.git#tag=v$pkgver")
sha256sums=('SKIP')
install=nexttrace.install

build() {
  cd "nexttrace-core"
  export BUILD_VERSION="$(git describe --tags --always)"
  export COMMIT_SHA1="$(git rev-parse --short HEAD)"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X 'github.com/xgadget-lab/nexttrace/config.Version=${BUILD_VERSION}' -X 'github.com/xgadget-lab/nexttrace/config.CommitID=${COMMIT_SHA1}' " \
    .
}

package() {
  cd "nexttrace-core"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
