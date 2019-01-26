# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=jiri-git
pkgver=r1437
pkgrel=1
pkgdesc='A tool for multi-repo development similar to Android repo'
arch=(i686 x86_64)
url='https://fuchsia.googlesource.com/jiri'
license=(MIT)
depends=()
makedepends=(git go-pie)
source=(git+https://fuchsia.googlesource.com/jiri)
sha1sums=('SKIP')

pkgver() {
  cd jiri
  echo r$(git rev-list --count master)
}

prepare() {
  mkdir -p gopath/src/fuchsia.googlesource.com
  ln -rTsf jiri gopath/src/fuchsia.googlesource.com/jiri
  export GOPATH="$srcdir"/gopath
  cd gopath/src/fuchsia.googlesource.com/jiri
  go get -v -d ./...
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/fuchsia.googlesource.com/jiri
  go build -v \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    ./cmd/...
}

package() {
  cd jiri
  install -D -m755 jiri "$pkgdir"/usr/bin/jiri
  install -D -m644 scripts/jiri-bash-completion.sh "$pkgdir"/usr/share/bash-completion/completions/jiri
}
