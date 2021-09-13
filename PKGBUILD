# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgbase=nldev-phkr
pkgname=nldev
pkgver=0.4
pkgrel=1
pkgdesc="frontend for mdev, replacing the over-engineered udevd"
url="http://git.r-36.net/nldev/"
arch=('i686' 'x86_64' 'aarch64')
makedepends=(git)
depends=('mdev' 'libudev-zero')
license=('MIT')
_commit=662ba2
source=("git://git.r-36.net/nldev#commit=$_commit"
        "0001-increase_buffer.patch"
        'config.mk'
        'config.h'
        'modprobe_env'
        'hook'
        'install')
md5sums=('SKIP'
         '508367c15bf5117870c7dc0765cba2b9'
         '1c4dcaf94bebdcb8f47a520776fd9ee0'
         'ea205fb256e238fbbfccf306a9cfad53'
         'd1b6c44df9341b820580ddca68916bc6'
         '08bc0a3a9fdbe7d1da7d04e1cd410de4'
         'a4d070d365a0d3636f0e28d89beca106')
provides=('udev' 'eudev')

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -Np1 -i ../0001-increase_buffer.patch

	cp ../config.mk ./
	cp ../config.h ./
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir"
	install -m644 -D hook "$pkgdir/usr/lib/initcpio/hooks/nldev"
	install -m644 -D install "$pkgdir/usr/lib/initcpio/install/nldev"
	install -m755 -D modprobe_env "$pkgdir/usr/bin/modprobe_env"
}
