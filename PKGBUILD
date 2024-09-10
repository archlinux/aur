pkgname=nexttrace
pkgver=1.3.4
pkgrel=1
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/nxtrace/NTrace-core"
license=('GPL-3.0-or-later')
makedepends=('go' 'git')
source=("git+https://github.com/nxtrace/NTrace-core.git#tag=v$pkgver")
sha256sums=('a728ab2cffd18c4b2e2e50fb710d922116bb8ec6a16868fae088a6035e3bf5ef')

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
