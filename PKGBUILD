# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=pkglint
pkgver=1.3.0
pkgrel=1
pkgdesc='Security-focused linter for Arch Linux PKGBUILDs'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/pkglint'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go' 'git')
_commit='c876b3424b5cd62cba607d33a23e79c387193ae7'
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
  cd "$pkgname" || exit

  CGO_ENABLED=0 go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags="-X main.version=v$pkgver -s -w" -o "$pkgname"
}

package() {
  cd "$pkgname" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
