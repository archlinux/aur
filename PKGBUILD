# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=realize-git
_pkgname=realize
pkgver=v2.0.2.r35.g498ce46
pkgrel=1
pkgdesc="Golang live reload and task runner"
arch=('x86_64')
url="https://gorealize.io/"
license=('GPL')
depends=('glibc')
makedepends=('go' 'git')
provides=('realize')
options=('!strip')
source=('git+https://github.com/oxequa/realize.git')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$_pkgname" .
}

check() {
  cd "${_pkgname}"
  go test ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 realize/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}