# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=tfsort
pkgver=0.7.1
pkgrel=5
pkgdesc="A CLI utility to sort Terraform variables and outputs"
arch=('x86_64' 'aarch64')
url="https://github.com/AlexNabokikh/tfsort"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
_commit='7ee247ad156b4e5b6c6a7ffd08eff4a4c5d376b5'
source=("git+https://github.com/AlexNabokikh/tfsort.git#commit=$_commit")
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
