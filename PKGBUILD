# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=pkglint
pkgver=1.5.2
pkgrel=1
pkgdesc='Security-focused linter for Arch Linux PKGBUILDs'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/pkglint'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go' 'git')
_commit='0f339c716e1e58741508ff2f8e4edec113347726'
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

  go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
    -ldflags="-linkmode=external -X main.version=v$pkgver -s -w" -o "$pkgname"
}

package() {
  cd "$pkgname" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
