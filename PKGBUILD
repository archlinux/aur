# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=wacli
pkgver=0.17.2
pkgrel=2
pkgdesc="WhatsApp CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/wacli"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
_commit='aba0f35c7558e5de3050f1d53483c1f3505c55f2'
source=("git+https://github.com/openclaw/wacli.git#commit=$_commit")
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
    -tags sqlite_fts5 \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/wacli
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
