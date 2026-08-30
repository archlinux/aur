# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=hashi-up
pkgver=0.16.0
pkgrel=5
pkgdesc="bootstrap HashiCorp Consul, Nomad, or Vault over SSH < 1 minute"
arch=('x86_64' 'aarch64')
url="https://github.com/jsiebens/hashi-up"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='b062f5d9d4040b591f733a9e58e8977faad1ae88'
source=("git+https://github.com/jsiebens/hashi-up.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$pkgname" || exit
  go build -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
