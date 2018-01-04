# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=fac
pkgver=1.0.1
pkgrel=1
pkgdesc="Easy-to-use command line tool for fixing git conflicts."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mkchoi212/fac"
license=('MIT')
options=('!strip' '!emptydirs')
makedepends=(
  'git'
  'go'
)
source=("https://github.com/mkchoi212/fac/archive/v${pkgver}.tar.gz")
sha256sums=('29f1a92739207db183bdfdd2ef8d3aa3e4da507ef627d6ce5da401bd50e6594b')

prepare() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="$GOPATH/bin"
  mkdir -p "$GOPATH"
  rm -rf "$GOPATH/src"
  ln -sf "$srcdir/$pkgname-$pkgver/vendor" "$GOPATH/src"

  mkdir -p "$GOPATH/src/github.com/mkchoi212/fac"
  mv "$srcdir/$pkgname-$pkgver/color" "$GOPATH/src/github.com/mkchoi212/fac"
  mv "$srcdir/$pkgname-$pkgver/conflict" "$GOPATH/src/github.com/mkchoi212/fac"
}

build() {
  export GOPATH="${srcdir}/.go"
  export GOBIN="$GOPATH/bin"
  cd "$srcdir/$pkgname-$pkgver"
  go build -v -o ${pkgname} -ldflags "-s -w -X main.version=${pkgver}"
}

package() {
  _output="${srcdir}/$pkgname-$pkgver"
  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install manpage (does not exist yet)
  # install -Dm644 "${_output}/fac.8" "${pkgdir}/usr/share/man/man8/fac.8"
}
