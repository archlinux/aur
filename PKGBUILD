# Maintainer : Mendel Greenberg <chabad 360 at gmail dot com>

_pkgbase='rapiddisk'
pkgname="$_pkgbase-dkms"
_vermajor=8
_verminor=2
_verrevision=0
pkgver=${_vermajor}.${_verminor}.${_verrevision}
pkgrel=1
pkgdesc="Advanced Linux RAM Drive and Caching kernel modules"
arch=('i686' 'x86_64')
url="http://www.rapiddisk.org/"
license=('GPL2')
depends=('dkms'
         'zlib'
         'cryptsetup'
         'libmicrohttpd')
makedeps=('jansson')
install=${pkgname}.install
_gitcommit=a311249
source=("git+https://github.com/pkoutoupis/rapiddisk#commit=${_gitcommit}")

md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgbase}"
  #patch -Np1 -i "${srcdir}/kernel510up.patch"
}

build() {
    ls -lsh ${srcdir}
    cd "${srcdir}/${_pkgbase}"

    # build package
    cd src
    make
    cd ..
    #make DESTDIR=${pkgdir} all

    # gzip manpages
    gzip -c doc/${_pkgbase}.1 > doc/${_pkgbase}.1.gz

}

package() {

    cd "${srcdir}/${_pkgbase}"

    # standard installation
    #make DESTDIR=${pkgdir} install
    cd src
    make DESTDIR=${pkgdir} install
    cd ../conf
    make DESTDIR=${pkgdir} install
    cd ../doc
    make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cd ../module
    cp rapiddisk.c rapiddisk-cache.c dkms.conf Makefile ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cd ..


    # Arch's /sbin is a symbolic link to /usr/bin
    mv ${pkgdir}/sbin ${pkgdir}/usr/bin

    # copy documentation
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" \
        doc/${_pkgbase}.1.gz
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/" \
        README.md \
        module/${_pkgbase}.txt

}
