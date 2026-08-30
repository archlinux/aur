# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=madonctl
pkgver=3.0.3
pkgrel=5
pkgdesc="CLI client for the Mastodon social network API"
arch=('x86_64' 'aarch64')
url="https://github.com/McKael/madonctl"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='d4f66239952009e7b0f294b595a87ea11af65118'
source=("git+https://github.com/McKael/madonctl.git#commit=$_commit")
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
  go build -buildmode=pie -modcacherw \
    -trimpath \
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
