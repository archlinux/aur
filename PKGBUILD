# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-git
_gitname=gdu
pkgver=v4.6.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu gdu-bin)
makedepends=('go')
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("$_gitname::git+https://github.com/Dundee/gdu")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$_gitname"
  mkdir -p dist/
}

build() {
  cd "$_gitname"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  make build VERSION=$pkgver
}

package() {
  cd "$_gitname"
  install -Dm755 "dist/$_gitname" "${pkgdir}"/usr/bin/gdu
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/gdu.1
}

