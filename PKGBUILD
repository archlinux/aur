# Maintainer: Daniel Lublin <daniel@lublin.se>
# Contributor: Daniel Lublin <daniel@lublin.se>

_pkgname=sigtop
pkgname=$_pkgname-git
pkgver=0.24.0.r1.gba5e721
pkgrel=1
pkgdesc='Export messages from Signal Desktop'
arch=('i686' 'x86_64')
url="https://github.com/tbvdm/$_pkgname"
license=('ISC')
makedepends=('git' 'go')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  go mod download -x
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS//-flto*}"
  export CGO_CFLAGS="${CFLAGS//-flto*} -ftls-model=initial-exec"
  export CGO_CXXFLAGS="${CXXFLAGS//-flto*}"
  export CGO_LDFLAGS="${LDFLAGS//-flto*}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $_pkgname ./cmd/$_pkgname
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm755 cmd/$_pkgname/$_pkgname.1 "$pkgdir"/usr/share/man/man1/$_pkgname.1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.md"
}
