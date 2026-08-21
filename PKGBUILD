# Maintainer: Gaurav Kumar Yadav <gaurav712@protonmail.com>

pkgname=transmission-tui-git
_pkgname=transmission-tui
pkgver=r2.a297118
pkgrel=1
pkgdesc="htop-like terminal UI for transmission-daemon"
url="https://codeberg.org/gaurav712/transmission-tui"
arch=(x86_64 aarch64)
license=(MIT)
depends=(glibc)
makedepends=(git go)
optdepends=('transmission-cli: local transmission-daemon')
provides=(transmission-tui)
conflicts=(transmission-tui)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -s -w" -o $_pkgname .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
