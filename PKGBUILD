# Maintainer: Daniel Lublin <daniel@lublin.se>
# Contributor: Daniel Lublin <daniel@lublin.se>

_pkgname=sigtop
pkgname=$_pkgname-git
pkgver=0.7.0.r7.g8f170e5
pkgrel=2
pkgdesc='Export messages from Signal Desktop'
arch=('i686' 'x86_64')
url="https://github.com/tbvdm/$_pkgname"
license=('ISC')
makedepends=('git' 'go')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url#branch=master")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $_pkgname .
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm755 $_pkgname.1 "$pkgdir"/usr/share/man/man1/$_pkgname.1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.md"
}
