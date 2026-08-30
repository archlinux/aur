# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=yamldiff
pkgver=1.3
pkgrel=5
pkgdesc="A CLI tool to diff two YAML files."
arch=('x86_64' 'aarch64')
url="https://github.com/sahilm/yamldiff"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='584d5771767b262cf171d9c1f890d6daeb82492c'
source=("git+https://github.com/sahilm/yamldiff.git#commit=$_commit")
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
