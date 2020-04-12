# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=3mux
pkgname="${_pkgname}-git"
pkgver=r197.09e2494
pkgrel=1
pkgdesc="Terminal multiplexer inspired by i3"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'pentium4')
url="https://github.com/aaronjanse/3mux"
_gopkg="github.com/aaronjanse/3mux"
license=('MIT')
makedepends=(
  'go'
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha1sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare(){
  cd "$srcdir/$_pkgname"
  go mod init "$_gopkg"
}


build() {
  cd "$srcdir/$_pkgname"
  export GOPATH="$srcdir/gopath" 

  go build \
      -trimpath \
      -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
