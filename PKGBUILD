# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgbase=smdev-phkr
pkgname=smdev
pkgver=0.2.3
pkgrel=10
_rev=8d07540
pkgdesc='Suckless mdev'
arch=('i686' 'x86_64' 'aarch64')
url="http://git.suckless.org/smdev/"
makedepends=( 'git' )
provides=('mdev')
license=( 'MIT/X' )
options=( 'strip' )
install='smdev.install'
source=(
    "git+https://git.suckless.org/smdev#commit=${_rev}"
    'scan_all.patch'
    'glibc.patch'
    'usb_nodes.patch'
    'config.h'
    'processdev'
    '00-modprobe'
    '99-remove_links'
    'initcpio.hook'
    'initcpio.install'
)

sha1sums=('SKIP'
          'a90bd08c8c482dec4b8cc063b4841db034ea7e1e'
          'b300e68de6bcb6f542bb28206ab10f6ceca242bc'
          'f0e3bfc2956d0c8885e08732cff8d0f9b6cf7103'
          '1f6b9327866981ffab4a275a64ee5c5249038968'
          'd741887a118ed921528189754d886159782ca6fe'
          '396e84460ba95dcf3aeaaf9f2bc711be92a2c395'
          '2fa17e2c0ab472fb1ec7a1b04630393df67cf07a'
          '7fe74315c9a3592c2eb66cea8cd652da04461786'
          'ea04c776d0f6b749bfd1fc421d51c5ecd07379b5')

prepare() {
	cd "${srcdir}/${pkgname}"
	cp "${srcdir}/config.h" config.h
	patch -Np1 -i ../scan_all.patch
	patch -Np1 -i ../glibc.patch
	patch -Np1 -i ../usb_nodes.patch
}

build() {
	cd "${srcdir}/${pkgname}"
	make clean
	cp ../config.h ./
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	cd "${srcdir}"
	install -m744 -D processdev ${pkgdir}/etc/smdev/processdev
	install -m644 -D 00-modprobe $pkgdir/etc/smdev/00-modprobe
	install -m644 -D 99-remove_links $pkgdir/etc/smdev/remove/99-remove_links
	install -m644 -D initcpio.hook $pkgdir/usr/lib/initcpio/hooks/smdev
	install -m644 -D initcpio.install $pkgdir/usr/lib/initcpio/install/smdev
}
