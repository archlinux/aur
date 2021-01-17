# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu-git
_gitname=gdu
pkgver=v3.0.0.r9.g718c32c
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("$_gitname::git+https://github.com/Dundee/gdu")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  user=`id -u -n`
  time=`LC_ALL=en_US.UTF-8 date`
  goldflags="-s -w \
	  -X 'github.com/dundee/gdu/build.Version=${pkgver}' \
	  -X 'github.com/dundee/gdu/build.User=${user}' \
	  -X 'github.com/dundee/gdu/build.Time=${time}'"

  go build -ldflags="$goldflags" -o $_gitname .
}

package() {
  cd $_gitname
  install -Dm755 $_gitname "${pkgdir}"/usr/bin/$_gitname
}

