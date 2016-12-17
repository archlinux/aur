# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=jiri-git
pkgver=r1121
pkgrel=1
pkgdesc='A tool for multi-repo development similar to Android repo'
arch=(i686 x86_64)
url='https://fuchsia.googlesource.com/jiri'
license=(MIT)
makedepends=(git go)
source=(git+https://fuchsia.googlesource.com/jiri)
sha1sums=('SKIP')

pkgver() {
  cd jiri
  echo r$(git rev-list --count master)
}

prepare() {
  cd jiri

  mkdir -p build
  mkdir -p .gopath/src/fuchsia.googlesource.com/
  ln -sf "$PWD" .gopath/src/fuchsia.googlesource.com/jiri
  export GOPATH="$PWD/.gopath"
}

build() {
  cd jiri

  go build -o build/jiri fuchsia.googlesource.com/jiri/cmd/jiri # -gccgoflags "$CFLAGS $LDFLAGS"
}

package() {
  cd jiri
  install -D -m755 build/jiri "$pkgdir"/usr/bin/jiri
  install -D -m644 scripts/jiri-bash-completion.sh "$pkgdir"/usr/share/bash-completion/completions/jiri
}
