# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=plakar-git
_pkgname=plakar
pkgdesc="Backup for lazy^W smart engineers."
pkgver=1.0.3.r97.g700a7872
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://plakar.io/"
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
  "$_pkgname::git+https://github.com/PlakarKorp/plakar#branch=main"
)

sha256sums=(
  "SKIP"
)

_ensure_common_env() {
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
}

prepare() {
  _ensure_common_env
  cd "$srcdir/$_pkgname"

  go mod vendor \
    -modcacherw
}

check() {
  _ensure_common_env
  cd "$srcdir/$_pkgname"

  go test \
    -mod=vendor \
    ./...
}

build() {
  _ensure_common_env
  cd "$srcdir/$_pkgname"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -ldflags "\
      -linkmode=external \
      -buildid=''
      -extldflags \"${LDFLAGS}\"" \
    -v .
}

package() {
  install -D -m0755 "$srcdir/$_pkgname/plakar" "$pkgdir/usr/bin/plakar"
  for command in $(find "$srcdir/$_pkgname" -name "*.1" -type f); do
    install -D -m0644 "$command" "$pkgdir/usr/share/man/man1/$(basename $command)"
  done
  for command in $(find "$srcdir/$_pkgname" -name "*.7" -type f); do
    install -D -m0644 "$command" "$pkgdir/usr/share/man/man7/$(basename $command)"
  done
  install -D -m0644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/plakar/LICENSE"
}
