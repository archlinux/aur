# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=vgo-git
pkgver=r34.88f0e96
pkgrel=1
pkgdesc='Versioned Go (git version)'
arch=('x86_64')
url='https://github.com/golang/vgo'
license=('BSD')
makedepends=('go')
source=("git+https://github.com/golang/vgo")
sha256sums=('SKIP')

# create a fake go path directory and pushd into it
# $1 real directory
# $2 gopath directory
_fake_gopath_pushd() {
  mkdir -p "$GOPATH/src/${2%/*}"
  rm -f "$GOPATH/src/$2"
  ln -rsT "$1" "$GOPATH/src/$2"
  pushd  "$GOPATH/src/$2" >/dev/null
}

_fake_gopath_popd() {
  popd >/dev/null
}

pkgver() {
	cd vgo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"
	export GOPATH="$srcdir"
	export PATH="$GOPATH/bin:$PATH"
	_fake_gopath_pushd vgo github.com/golang/vgo
	go get
	go build
	_fake_gopath_popd
}

package() {
	cd "$srcdir"
    mkdir -p "$pkgdir"/usr/bin
	install -Dm755 bin/vgo "$pkgdir"/usr/bin/
}
