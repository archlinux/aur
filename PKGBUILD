# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=pagerduty-short-circuiter
pkgver=0.1.0
pkgrel=1
pkgdesc="Integration of go-pagerduty and ocm-container to spawn ocm-container with automatic cluster login and other features based on PagerDuty alerts."
arch=(x86_64)
url="https://github.com/openshift/pagerduty-short-circuiter"
license=('Apache-2.0')
makedepends=(git go)
_commit="abe4840436f2907e3f064ad94bcc370d01a50ac1" # 27 Feb 2023
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/kite
}

check() {
  cd "$pkgname"
  go test -v ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/kite "$pkgdir"/usr/bin/kite
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/kite/LICENSE"
}
