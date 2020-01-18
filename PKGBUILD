# Maintainer: Peter Roberts <me@peter-r.co.uk>
pkgname=go-zoom
pkgver=0.1.3
pkgrel=1
pkgdesc="Parallel command executor with a focus on simplicity and good cross-platform behaviour."
arch=("any")
url="https://github.com/pwr22/go-zoom"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("https://github.com/pwr22/zoom/archive/v$pkgver.tar.gz")
sha256sums=("5de12cba2b241febbf8b179b4ae2deb81c56258a70c6f3005054f6ee0a53d4eb")

# Go stuff based on https://wiki.archlinux.org/index.php/Go_package_guidelines

prepare(){
  mkdir -p "go/src/github.com/pwr22"
  ln -rTsf "$pkgname-$pkgver" "go/src/github.com/pwr22/$pkgname"

  export GOPATH="$srcdir/go"
  export GOFLAGS="-gcflags=all=-trimpath=$PWD -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=$LDFLAGS"

  cd "go/src/github.com/pwr22/$pkgname" # going through the symlink is necessary to make go get happy
  go get ./...
}

build() {
	cd "$pkgname-$pkgver"

	export GOPATH="$srcdir/go"
	export GOFLAGS="-gcflags=all=-trimpath=$PWD -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=$LDFLAGS"

    go build -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
