# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=enpasscli
_pkgname=enpass-cli
pkgver=1.14.0
pkgrel=1
pkgdesc="Enpass commandline client"
arch=('x86_64' 'aarch64')
url="https://github.com/hazcod/enpass-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='76beaa9ddce13f74a4f7aa1e3002ef90e05ba1d6'
source=("git+https://github.com/hazcod/enpass-cli.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$_pkgname" || exit
  go build -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/enpasscli
}

package() {
  cd "$_pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
