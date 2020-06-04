# Maintainer : Mendel Greenberg <chabad 360 at gmail dot com>

_pkgbase='rapiddisk'
pkgname="$_pkgbase-dkms"
_vermajor=6
_verminor=1
_verrevision=0
pkgver=${_vermajor}.${_verminor}.${_verrevision}
pkgrel=1
pkgdesc="Advanced Linux RAM Drive and Caching kernel modules"
arch=('i686' 'x86_64')
url="http://www.rapiddisk.org/"
license=('GPL2')
depends=('dkms'
         'zlib'
         'cryptsetup')
makedeps=('jansson')
install=${pkgname}.install
_gitcommit=4f74161
source=("git+https://github.com/pkoutoupis/rapiddisk#commit=${_gitcommit}")

md5sums=('SKIP')

build() {
    ls -lsh ${srcdir}
    cd "${srcdir}/rapiddisk"

    # build package
    make DESTDIR=${pkgdir} all

    # gzip manpages
    gzip -c doc/${_pkgbase}.1 > doc/${_pkgbase}.1.gz

}

package() {

    cd "${srcdir}/rapiddisk"

    # standard installation
    #make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cd module
    cp rapiddisk.c rapiddisk-cache.c dkms.conf Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cd ..


    # Arch's /sbin is a symbolic link to /usr/bin
    #mv ${pkgdir}/sbin ${pkgdir}/usr/bin

    # copy documentation
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" \
        doc/${_pkgbase}.1.gz
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/" \
        README.md \
        module/${_pkgbase}.txt

}
