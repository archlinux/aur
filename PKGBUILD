# Maintainer: Dan Printzell <me@vild.io>

pkgname=('workspace-d-git')
pkgver=r66.74b5202
pkgrel=1
pkgdesc="Wraps dcd, dfmt and dscanner to one unified environment managed by dub"
arch=('i686' 'x86_64')
url="https://github.com/Pure-D/workspace-d"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub')
depends=('libphobos' 'dub' 'dcd' 'dfmt' 'dscanner')
provides=('workspace-d')
conflicts=('workspace-d')

source=(
	"git+https://github.com/Pure-D/workspace-d"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd $srcdir/workspace-d
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/workspace-d
	git submodule update --init --recursive
	dub upgrade
}

build() {
	cd $srcdir/workspace-d
	dub build --cache=local
	strip workspace-d
}

package(){
	cd $srcdir/workspace-d

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -m755 -t $pkgdir/usr/bin ./workspace-d
}
