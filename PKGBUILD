# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=iftree
pkgver=0.0.10
pkgrel=5
pkgdesc="iftree help understand container networks by visualizing network interfaces( veth bridge lo ) relation , output in text, table, images and dot language."
arch=('x86_64' 'aarch64')
url="https://github.com/t1anz0ng/iftree"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='98b48988d2737c572ad7694089c9e502ac9b73e5'
source=("git+https://github.com/t1anz0ng/iftree.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  # go-graphviz vendors graphviz's C sources and silences their warnings with
  # `#cgo CFLAGS: -w`, which lands after ours and disables -Wformat. That makes
  # Arch's -Werror=format-security fatal on a diagnostic about itself being
  # ignored, so demote just that one back to a warning.
  export CGO_CFLAGS="${CFLAGS} -Wno-error=format-security"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$pkgname" || exit
  go build -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/iftree
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
