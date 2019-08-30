# Maintainer : Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=rapiddisk-dkms
_vermajor=6
_verminor=0
_verrevision=1
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
_gitcommit=df31a80
source=("git+https://github.com/pkoutoupis/rapiddisk#commit=${_gitcommit}")

md5sums=('SKIP')

build() {
    cd "${srcdir}/rapiddisk"

    # build package
    make DESTDIR=${pkgdir} all
#    pushd src; make DESTDIR=${pkgdir} dkms; popd

    # gzip manpages
    gzip -c doc/${_pkgbase}.1 > doc/${_pkgbase}.1.gz

}

package() {

    cd "${srcdir}/rapiddisk"

    # standard installation
    make DESTDIR=${pkgdir} install

    # Arch's /sbin is a symbolic link to /usr/bin
    mv ${pkgdir}/sbin ${pkgdir}/usr/bin

    # copy documentation
    install -Dm644 -t "${pkgdir}/usr/share/man/man1/" \
        doc/${_pkgbase}.1.gz
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/" \
        README.md \
        module/${_pkgbase}.txt

}
