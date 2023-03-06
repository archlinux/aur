# Maintainer: Maxim De Clercq <youremail@domain.com>
_pkgname=capstan
pkgname=$_pkgname-git
pkgver=v0.4.1.r6.de91c4e
pkgrel=1
pkgdesc="Capstan, a tool for packaging and running your application on OSv."
arch=('i686' 'x86_64')
url="https://github.com/cloudius-systems/capstan"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=
source=("$_pkgname::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p build/
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
