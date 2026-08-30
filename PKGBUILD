# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
pkgname=aws-doctor
pkgver=2.21.1
pkgrel=3
pkgdesc="Diagnose AWS costs, detect idle resources, and optimize cloud spending directly from your terminal. 🩺 ☁️"
arch=('x86_64' 'aarch64')
url="https://github.com/elC0mpa/aws-doctor"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
_commit='3968ed47c60d5248e90e13a22fd456c18a5f6285'
source=("git+https://github.com/elC0mpa/aws-doctor.git#commit=$_commit")
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
