# Maintainer: p4u

pkgname=vocdoni-node
pkgver=0.6.0.r516.gb447fa3
pkgrel=1
pkgdesc="Vocdoni blockchain voting node"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/vocdoni/vocdoni-node"
license=('AGPLv3')
makedepends=('go' 'git')
optdepends=()
provides=("vocdoni-node")
conflicts=()
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd vocdoni-node
  git describe --long --tags | sed -e 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd vocdoni-node
}

build() {
  cd vocdoni-node
  GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -trimpath -tags=badgerdb"
  go build $GOFLAGS -ldflags="-w -s -X=go.vocdoni.io/dvote/internal.Version=$(git describe --always --tags --dirty --match='v[0-9]*')" -o vocdoni-node ./cmd/dvotenode
  go build $GOFLAGS -ldflags="-w -s -X=go.vocdoni.io/dvote/internal.Version=$(git describe --always --tags --dirty --match='v[0-9]*')" -o vocdoni-cli ./cmd/dvotecli
}

package() {
  cd vocdoni-node
  install -Dm755 vocdoni-node /usr/bin/vocdoni-node
  install -Dm755 vocdoni-cli /usr/bin/vocdoni-cli
}
