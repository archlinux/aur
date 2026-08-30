# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=pep-ebook
pkgver=1.0.10
pkgrel=5
pkgdesc="📚自动下载带书签的电子书(人民教育教出版社)"
arch=('x86_64' 'aarch64')
url="https://github.com/maogou/pep-ebook"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='acd7f84305ae3206fcecf3f48d503b701d3b5f6b'
source=("git+https://github.com/maogou/pep-ebook.git#commit=$_commit")
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
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
