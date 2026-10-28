# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=gh-markdown-preview
pkgver=1.12.1
pkgrel=1
pkgdesc="GitHub CLI extension to preview Markdown looks like GitHub."
arch=('x86_64' 'aarch64')
url="https://github.com/yusukebe/gh-markdown-preview"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='5dd9991c1e00b5886beedd7bbab6874b65966720'
source=("git+https://github.com/yusukebe/gh-markdown-preview.git#commit=$_commit")
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
    -o cmd/$pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 cmd/$pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
