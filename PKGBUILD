# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>
# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=terminal-parrot
pkgver=1.1.1
pkgrel=1
conflicts=('terminal-parrot-git')
pkgdesc="Party parrot (http://cultofthepartyparrot.com) for your terminal"
arch=('any')
url="https://github.com/jmhobbs/terminal-parrot"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jmhobbs/terminal-parrot/archive/$pkgver.tar.gz")
sha256sums=('93acae68396c8cb9e7a7ef4911503f03656e427b5791f4c2e5c9b3f8e56dce8d')

prepare() {
    mkdir -p go
    echo $srcdir
    export GOPATH="$srcdir/go"
    go get github.com/nsf/termbox-go
}

build() {
  export GOPATH="$srcdir/go"
  cd "$pkgname-$pkgver"

	go build \
	  -trimpath \
	  -buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		.
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
