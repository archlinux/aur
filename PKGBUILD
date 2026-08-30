# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=cfnctl
pkgver=0.1.1
pkgrel=5
pkgdesc="Cfnctl brings the Terraform cli experience to AWS Cloudformation :cloud:   "
arch=('x86_64' 'aarch64')
url="https://github.com/rogerwelin/cfnctl"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='531a84a615ebb95aaa94eec5323230a468cfd00a'
source=("git+https://github.com/rogerwelin/cfnctl.git#commit=$_commit")
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
    ./cmd/cfnctl
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
