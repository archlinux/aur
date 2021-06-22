# Maintainer: p4u

pkgname=vocdoni-node
pkgver=1.0.3.r0.gb447fa39
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
  GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -tags=badgerdb"
  LDFLAGS="-w -s -X=go.vocdoni.io/dvote/internal.Version=$pkgver"
  go build $GOFLAGS -ldflags="$LDFLAGS" -o vocdoni-node ./cmd/dvotenode
  go build $GOFLAGS -ldflags="$LDFLAGS" -o vocdoni-cli ./cmd/dvotecli
}

package() {
  cd vocdoni-node
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 0755 vocdoni-node ${pkgdir}/usr/bin/vocdoni-node
  install -m 0755 vocdoni-cli ${pkgdir}/usr/bin/vocdoni-cli
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
