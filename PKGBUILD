# Maintainer: github.com/lmorg
pkgname=murex-git
pkgver=r2751.28de804d
pkgrel=1
pkgdesc="Bash-like shell designed for greater commandline productivity and safer shell scripts (git development branch)"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
provides=('murex')
license=('GPL2')
makedepends=('git' 'go')
optdepends=('aspell: inline spell checking')
source=("git+https://github.com/lmorg/murex.git")
sha1sums=('SKIP')

prepare(){
  mkdir -p "$srcdir/build"
  cd "$srcdir/murex"
  export GOPATH="$srcdir/build"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  git checkout develop
  go mod vendor
}

pkgver() {
  cd "$srcdir/murex"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/murex"
  export GOPATH="$srcdir/build"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v
}

check() {
  cd "$srcdir/murex"
  export GOPATH="$srcdir/build"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  mkdir -p "$GOPATH/src/github.com/lmorg/"
  ln -s "$srcdir/murex" "$GOPATH/src/github.com/lmorg/" || true
  go test ./... || true
  ./murex -c 'g: behavioural/*.mx -> foreach: f { source $f }; try {test: run *}'
}

package() {
  cd "$srcdir/murex"
  install -D -m755 murex "$pkgdir/usr/bin/murex"
}
