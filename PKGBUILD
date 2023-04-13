# Maintainer: Tharre <tharre3@gmail.com>

pkgname=diod
pkgver=1.0.24
pkgrel=2
pkgdesc="A multi-threaded, user space file server that speaks 9P2000.L"
url="https://github.com/chaos/diod"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libcap' 'lua')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/chaos/diod/releases/download/${pkgver}/diod-${pkgver}.tar.gz"
	"0001-FreeBSD-port.patch"
	"0002-diod-ops.c-add-header-file-for-makedev.patch"
	"0003-Diod-Lua-detection-fix-and-replacing-deprecated-func.patch")
sha256sums=('f41d2b91c1a712132f5457d9d1c3caca985f069bdc8ef27bf4c148ac1d9f8c9f'
            'a06021fbc278be5a1cf13b3d072a2d5d17ce3c22c984b1cbe4fe63b31e8d00c8'
            '37c60fde16505d031733a2f79b31f5acbf6b70aec486c7635be6e3de6896958d'
            '0438654256a42125a06182ee4ffa7c49de040f4eb419547de258794f0a9f21dc')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i ../0001-FreeBSD-port.patch
	patch -p1 -i ../0002-diod-ops.c-add-header-file-for-makedev.patch
	patch -p1 -i ../0003-Diod-Lua-detection-fix-and-replacing-deprecated-func.patch

	# regenerate, since we patched stuff
	aclocal -I config
	automake --copy --add-missing
	autoconf
}

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --with-ncurses
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make "DESTDIR=$pkgdir" install

	ln -s diodmount "${pkgdir}/usr/bin/mount.diod"

	install -Dm644 scripts/diod.service -t "${pkgdir}/usr/lib/systemd/system"
	rm -rf "$pkgdir/etc/systemd"
}
