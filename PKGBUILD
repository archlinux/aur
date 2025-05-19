# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=plakar-git
_pkgname=plakar
pkgdesc="Backup for lazy^W smart engineers."
pkgver=1.0.0.beta.6.r1063.g8e87cb17
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/PlakarKorp/plakar"
license=('ISC')
provides=('plakar')
conflicts=('plakar')
makedepends=(
  'go'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
  "$_pkgname::git+${url}#branch=main"
)

sha256sums=(
  "SKIP"
)

prepare() {
  cd "$srcdir/$_pkgname"
  export GOPATH="$srcdir/gopath"
  go mod vendor -modcacherw
}

check() {
  cd "$srcdir/$_pkgname"
  go test ./...
}

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$_pkgname"

  mkdir -p ./bin

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -ldflags "\
      -linkmode=external \
      -buildid=''
      -extldflags \"${LDFLAGS}\"" \
    ./
}

package() {
  install -D -m0755 $srcdir/$_pkgname/plakar $pkgdir/usr/bin/plakar
  install -D -m0644 $srcdir/$_pkgname/plakar.1 $pkgdir/usr/share/man/man1/plakar.1
  install -D -m0644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/plakar/LICENSE
}
