# Maintainer: Cody Schafer <dev@codyps.com>

pkgrel=1
_bpn=diod
pkgname=$_bpn-git
pkgdesc="A multi-threaded, user space file server that speeks 9P2000.L"
license=('GPL2')
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/chaos/diod.git"

source=("git+https://github.com/chaos/diod.git")
md5sums=('SKIP')

conflicts=("$_bpn")
provides=("$_bpn")

# If munge is disabled (via configure script), it can be omitted entirely
# LUA can be disable in configure, but config files are lua. Unclear what fallback is.
# libwrap can be disabled, if desired
makedepends=('git')
depends=('lua' 'libwrap' 'libcap' 'bash')
optdepends=('munge')

# from https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver=1.0.24.r11.g0ea3fe3
pkgver() {
	cd "$srcdir/$_bpn"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$_bpn"
	./autogen.sh
}

build () {
	cd "$srcdir/$_bpn"
	./configure --prefix=/usr --with-ncurses --sysconfdir=/etc --sbindir=/usr/bin
	make
}

package () {
	cd "$srcdir/$_bpn"
	make "DESTDIR=$pkgdir" install

	# Fix incorrect location for systemd file
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	mv "$pkgdir"/etc/systemd/system/diod.service "$pkgdir"/usr/lib/systemd/system
	rmdir "$pkgdir/etc/systemd/system"
	rmdir "$pkgdir/etc/systemd"

}
