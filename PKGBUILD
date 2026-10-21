# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=wacli
pkgver=0.24.0
pkgrel=1
pkgdesc="WhatsApp CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/wacli"
license=('unknown')
depends=('glibc')
makedepends=('go' 'git')
_commit='0d54b6b5370cfd256300e4bfb1d51dcf90afeb30'
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
