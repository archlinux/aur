# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgbase=smdev-phkr
pkgname=smdev
pkgver=0.2.3
pkgrel=1
_rev=8d07540
pkgdesc='Suckless mdev (patched version)'
arch=( 'i686' 'x86_64' )
url="http://git.suckless.org/smdev/"
makedepends=( 'git' )
depends=( 'mksh' ) # mksh allows to procced scripts faster with almost bash compatible syntax
license=( 'MIT/X' )
options=( 'strip' )
provides=(smdev)
conflicts=(smdev)
source=(
    "git+https://git.suckless.org/smdev#commit=${_rev}"
    'scan_all.patch'
    'glibc.patch'
    'config.h'
    'proceeddev'
    '00-modprobe'
    '99-remove_links'
)

sha1sums=('SKIP'
          '00721a385678a2e576606d85463ca8ab4ba4da27'
          'b300e68de6bcb6f542bb28206ab10f6ceca242bc'
          '61cd0f4c67c70cddadc58c1e7c50fc7180983129'
          '983302eaf902e0ecd77a61ae90ba0c6d9c635d3e'
          '3a5d1f975539131248fde0db5e44c29798706ea7'
          '6a5369d9e3efc4317c907cc6140e509e82a559a5')

prepare() {
	cd "${srcdir}/${pkgname}"
	cp "${srcdir}/config.h" config.h
	patch -Np1 -i ../scan_all.patch
	patch -Np1 -i ../glibc.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make PREFIX=/usr DESTDIR="$pkgdir/" install
    cd "${srcdir}"
    install -m744 -D proceeddev $pkgdir/etc/smdev/proceeddev
    install -m644 -D 00-modprobe $pkgdir/etc/smdev/add/00-modprobe
    install -m644 -D 99-remove_links $pkgdir/etc/smdev/remove/99-remove_links
}


