# Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname=zentile-git
_pkgname="zentile"
pkgver=r7.c4e3fe0
pkgrel=1
pkgdesc="Automatic Tiling for EWMH Complaint Window Managers. Development version."
arch=('any')
url="https://github.com/blrsn/zentile"
license=('MIT')
depends=(
  'go'
)
optdepends=(
  'xorg-server: with EWMH Complaint Window Managers'
)
makedepends=(
  'git'
)

provides=('zentile')
conflicts=(
	'bin32-zentile'
	'zentile-bin'
)

source=("$_pkgname::git+https://github.com/blrsn/$_pkgname.git")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/$_pkgname" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/$_pkgname/"
	ln -sf "$srcdir/.go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo "Running 'go get'..."
	go get
}

package() {
	sudo install -Dm755 "$srcdir/.go/bin/$_pkgname" "$_pkgdir/usr/bin/$_pkgname"
}