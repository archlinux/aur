# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=snipkit
pkgver=1.8.1
pkgrel=5
pkgdesc="Snippet CLI manager for quickly generating and executing shell snippets without leaving the terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/lemoony/snipkit"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='7ad8cfefd6063d9280d64fc848570712ce14a3d0'
source=("git+https://github.com/lemoony/snipkit.git#commit=$_commit")
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
