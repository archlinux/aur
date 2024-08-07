pkgname=nexttrace
pkgver=1.3.2
pkgrel=1
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/nxtrace/NTrace-core"
license=('GPL-3.0-or-later')
makedepends=('go' 'git')
source=("git+https://github.com/nxtrace/NTrace-core.git#tag=v$pkgver")
sha256sums=('b4a20b0cf2e8f5a5236602cae54b691640dc6200e3a771d93767d07886222c30')

build() {
  cd "NTrace-core"
  export BUILD_VERSION="$(git describe --tags --always)"
  export COMMIT_SHA1="$(git rev-parse --short HEAD)"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X 'github.com/nxtrace/NTrace-core/config.Version=${BUILD_VERSION}' -X 'github.com/nxtrace/NTrace-core/config.CommitID=${COMMIT_SHA1}' " \
    .
}

package() {
  cd "NTrace-core"
  install -Dm755 NTrace-core "$pkgdir"/usr/bin/$pkgname
  setcap cap_net_raw,cap_net_admin+eip "$pkgdir"/usr/bin/$pkgname
}
