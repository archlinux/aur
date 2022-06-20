# Maintainer: github.com/lmorg
pkgname=murex-git
pkgver=r2255.59e27bb1
pkgrel=1
pkgdesc="Bash-like shell designed for greater commandline productivity and safer shell scripts"
arch=('i686' 'x86_64')
url="https://github.com/lmorg/murex"
provides=('murex')
license=('GPL2')
makedepends=('git' 'go')
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
  go test ./...
  ./murex -c 'g: behavioural/* -> foreach: f { source $f }; try {test: run *}'
}

package() {
	cd "$srcdir/murex"
	install -D -m755 murex "$pkgdir/usr/bin/murex"
}