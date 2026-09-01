# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=check-symlinks
pkgver=0.6.0
pkgrel=4
pkgdesc='Check for broken symlinks'
arch=('x86_64' 'aarch64')
url='https://github.com/jmelahman/check-symlinks'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_commit='5f3bc30f64e4b30543170fd8f7b049ce43505eea'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit

  git describe --tags | sed 's/^v//'
}

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

  CGO_ENABLED=1 go build -buildmode=pie -trimpath -modcacherw -ldflags="-linkmode=external -X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "$pkgname"
}

package() {
  cd "$pkgname" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
