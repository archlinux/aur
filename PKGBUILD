# Maintainer: Cody Schafer <dev@codyps.com>

pkgrel=1
_bpn=illum
pkgname=$_bpn-git
pkgdesc="A daemon that responds to brightness keys by changing the backlight level"
licence=('AGPLv3')
arch=('i686' 'x86_64')

url="https://github.com/jmesmon/$_bpn"
source=("git+$url"
	"git+https://github.com/jmesmon/ccan")

md5sums=('SKIP' 'SKIP')

conflicts=("$_bpn")
provides=("$_bpn")

makedepends=('git' 'ninja' 'sh' 'pkg-config')

depends=('libevdev' 'libev')

# from https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver=v0.2.r5.g8cce610
pkgver() {
	cd "$srcdir/$_bpn"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "$srcdir/$_bpn"
	git submodule init
	git config submodule.ccan.url $srcdir/ccan
	git submodule update
}

build () {
	cd "$srcdir/$_bpn"
	./build
}

package () {
	cd "$srcdir/$_bpn"
	DESTDIR=$pkgdir PREFIX=/usr ./do-install
}
