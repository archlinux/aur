# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=shhgit-git
_pkgname=${pkgname%-git}
pkgdesc='Reconnaissance tool for GitLab and GitHub organizations'
arch=(x86_64 i686 armv7h)
url='https://github.com/eth0izzle/shhgit'
_branch='master'
pkgver=r65.65351a7
pkgrel=1
license=('MIT')
makedepends=(git go)
source=("$_pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p "${pkgname}/build"
}

build() {
  cd $_pkgname

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
