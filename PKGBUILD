# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: xiretza <xiretza+aur@gmail.com>

_pkgname=3mux
pkgname="${_pkgname}-git"
pkgver=r197.09e2494
pkgrel=1
pkgdesc="Terminal multiplexer inspired by i3"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'pentium4')
url="https://github.com/aaronjanse/3mux"
_gopkg="github.com/aaronjanse/$_pkgname"
license=('MIT')
makedepends=('git' 'go-pie' 'golang-github-kr-pty' 'golang-golang-x-crypto')
provides=('3mux')
conflicts=('3mux')
source=("${_pkgname}::git+https://$_gopkg.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "gopath/src/${_gopkg%/*}"
  ln -rTsf "$_pkgname" "gopath/src/$_gopkg"
}

build() {
  export GOPATH="$srcdir/gopath:/usr/share/gocode"
  cd "gopath/src/$_gopkg"

  go install \
      -trimpath \
      -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  install -Dm755 "gopath/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
