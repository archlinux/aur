# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgbase=smdev-phkr
pkgname=smdev
pkgver=0.2.3
pkgrel=8
_rev=8d07540
pkgdesc='Suckless mdev'
arch=('i686' 'x86_64' 'aarch64')
url="http://git.suckless.org/smdev/"
makedepends=( 'git' )
depends=( 'mksh' ) # mksh allows to procced scripts faster with almost bash compatible syntax
license=( 'MIT/X' )
options=( 'strip' )
source=(
    "git+https://git.suckless.org/smdev#commit=${_rev}"
    'scan_all.patch'
    'glibc.patch'
    'config.h'
    'proceeddev'
    '00-modprobe'
    '99-remove_links'
    'initcpio.hook'
    'initcpio.install'
)

sha1sums=('SKIP'
          'a90bd08c8c482dec4b8cc063b4841db034ea7e1e'
          'b300e68de6bcb6f542bb28206ab10f6ceca242bc'
          '03a2f92c8c4f77784b7fdec8d53589f6a6b49112'
          '36415dd4b3f95877a6a6c9649eb489d9ee4ed944'
          '3a5d1f975539131248fde0db5e44c29798706ea7'
          '6a5369d9e3efc4317c907cc6140e509e82a559a5'
          '7fe74315c9a3592c2eb66cea8cd652da04461786'
          'b3142387784e5590c9ae56840f5eaf0dec54aa79')

prepare() {
	cd "${srcdir}/${pkgname}"
	cp "${srcdir}/config.h" config.h
	patch -Np1 -i ../scan_all.patch
	patch -Np1 -i ../glibc.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    cp ../config.h ./
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    cd "${srcdir}"
    install -m744 -D proceeddev ${pkgdir}/etc/smdev/proceeddev
    install -m644 -D 00-modprobe $pkgdir/etc/smdev/add/00-modprobe
    install -m644 -D 99-remove_links $pkgdir/etc/smdev/remove/99-remove_links
    install -m644 -D initcpio.hook $pkgdir/usr/lib/initcpio/hooks/smdev
    install -m644 -D initcpio.install $pkgdir/usr/lib/initcpio/install/smdev
}


