# Maintainer: Cody Schafer <dev@codyps.com>

pkgrel=1
_bpn=illum
pkgname=$_bpn-git
pkgdesc="A daemon that responds to brightness keys by changing the backlight level"
license=('AGPL3')
arch=('i686' 'x86_64')

url="https://github.com/jmesmon/$_bpn"
source=("git+$url"
	"git+https://github.com/rustyrussell/ccan.git")

md5sums=('SKIP' 'SKIP')

conflicts=("$_bpn")
provides=("$_bpn")

makedepends=('git' 'ninja' 'sh' 'pkg-config')

depends=('libevdev' 'libev')

# from https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver=0.5.r0.gf2b9364
pkgver() {
	cd "$srcdir/$_bpn"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
	cd "$srcdir/$_bpn"
	git submodule init
	git config submodule.ccan.url $srcdir/ccan

	# Enable cloning from 'file://' URLs.
	# Workaround for https://bugs.archlinux.org/task/76255
	git -c protocol.file.allow=always submodule update
}

build () {
	cd "$srcdir/$_bpn"
	./build
}

package () {
	cd "$srcdir/$_bpn"
	DESTDIR=$pkgdir PREFIX=/usr ./do-install
}
