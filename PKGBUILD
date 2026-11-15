# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=mac-cleanup-go
pkgver=1.8.0
pkgrel=1
pkgdesc="TUI macOS cleaner that scans caches/logs, shows sizes/paths, lets you select what to delete before Trash."
arch=('x86_64' 'aarch64')
url="https://github.com/2ykwang/mac-cleanup-go"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='0060b6327e153a6de6539ce229bd79bd9fded203'
source=("git+https://github.com/2ykwang/mac-cleanup-go.git#commit=$_commit")
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
