# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=nomore403
pkgver=2.0.1
pkgrel=3
pkgdesc="🚫 Advanced tool for security researchers to bypass 403/40X restrictions through smart techniques and adaptive request manipulation. Fast. Precise. Effective."
arch=('x86_64' 'aarch64')
url="https://github.com/devploit/nomore403"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='40e7b6cbe92e8acb2864425f14f3945d8fc19a16'
source=("git+https://github.com/devploit/nomore403.git#commit=$_commit")
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
