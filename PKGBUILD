# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Barry Smith <brrtsm gmail cvom->
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anntoin Wilkinson <anntoin gmail com>
# Contributor: Iñigo Alvarez<alvarezviu@gmail.com>

pkgname=rodent
pkgver=5.3.16.3
pkgrel=2
pkgdesc="Lightweight, yet full of options filemanager, compatible with console commands"
arch=('i686' 'x86_64')
url="http://xffm.org/"
license=('GPL3')
makedepends=('pkg-config' 'intltool' 'librsvg' 'ghostscript')
depends=('librfm5')
optdepends=('python2: for rfm-simple-agent')
source=(https://downloads.sourceforge.net/project/xffm/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('83c85501d3fe49e84abe9bb61a23ca4ec86fb22abb2e9a01228b3180d114380ff085ee58f51b9ac47173214ab8323e0bde7cfca6fb9b7907d4b1551ad48326f5')

build()
{
    cd "$pkgname-$pkgver"

    # The makefile tries to compile a module for which no source
    # file is present, so we need to disable the obex module.
    sed -i '/obex/d' apps/rodent-fuse/po/POTFILES.in

    ./configure --prefix=/usr #--disable-applications
    # Fight unused direct deps
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
    make
}

check () {
    cd "$pkgname-$pkgver"
    make check
}

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
