# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kapsul-git
_pkgname=kapsul
pkgdesc="A tool to create and manage deduplicated, compressed and encrypted PTAR vaults"
pkgver=0.0.0.beta.6.r14.g227eb65
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://plakar.io/"
license=('ISC')
provides=('kapsul')
conflicts=('kapsul')
makedepends=(
  'go'
)
optdepends=(
  'plakar: for the man pages'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
  "$_pkgname::git+https://github.com/PlakarKorp/kapsul#branch=main"
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

# Commenting tests for now (early dev)
# check() {
#   _ensure_common_env
#   cd "$srcdir/$_pkgname"

#   go test \
#     -mod=vendor \
#     ./...
# }

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
  # TODO: check why the module name changed to kapsul
  install -D -m0755 "$srcdir/$_pkgname/kapsul" "$pkgdir/usr/bin/kapsul"
  # for command in $(find "$srcdir/$_pkgname" -name "*.1" -type f); do
  #   install -D -m0644 "$command" "$pkgdir/usr/share/man/man1/$(basename $command)"
  # done
  install -D -m0644 "$srcdir/$_pkgname/kapsul.1" "$pkgdir/usr/share/man/man1/kapsul.1"
  install -D -m0644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
