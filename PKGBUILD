# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=enpasscli
_pkgname=enpass-cli
pkgver=1.12.0
pkgrel=3
pkgdesc="Enpass commandline client"
arch=('x86_64' 'aarch64')
url="https://github.com/hazcod/enpass-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='f6a6e889f0fac6a055e1f91071d11e58822ffd38'
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
