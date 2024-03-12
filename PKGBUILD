# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# Contributor: Daniel Milde <daniel at milde dot cz>

pkgname=gore
pkgdesc="Yet another Go REPL that works nicely"
pkgver=0.5.7
pkgrel=1
arch=('x86_64')
_gopkg="github.com/x-motemen/gore"
url="https://${_gopkg}"
license=('MIT')
depends=(
  'go'
)

# no idea why --flto=auto is added to the LDFLAGS with a format
# causing an issue with the compiler.
options=('!lto')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  'bbd06377093dd760f54fbc7ee608e67430f5f005464d92c7cc237bad57490dd0'
)

prepare(){
  cd $pkgname-$pkgver
  mkdir -p build/
}

build() {
    cd $pkgname-$pkgver
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "\
        -linkmode=external \
        -buildid=''
        -extldflags='${LDFLAGS}' \
        -X '${_gopkg}/cli.revision=${pkgver}'
        " \
      -o build ./cmd/gore
}

package() {
  cd "$pkgname-$pkgver"

  install -D -m0755 build/gore "${pkgdir}/usr/bin/gore"
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
