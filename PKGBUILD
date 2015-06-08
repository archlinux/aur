# Packager: Andrew <darkseed2007@yandex.ru>
pkgname=mcabber-crew-modules
pkgver=40
pkgrel=1
pkgdesc="All modules from MCabber repository. PKGBUILD for crew edition."
arch=('i686' 'x86_64')
url="http://wiki.mcabber.com/index.php/Modules"
license=('GPL')
conflicts=(mcabber-modules mcabber-modules-hg)
optdepends=('screen: for extsay module')
depends=('mcabber-crew-hg')
makedepends=('pkgconfig' 'mercurial')
provides=("mcabber-crew-modules")

_hgroot="http://hg.lilotux.net"
_hgrepo="mcabber-modules"

prepare() {
  cd ${srcdir}
  hg clone "${_hgroot}/${_hgrepo}"
}

build() {
    cd "${srcdir}/${_hgrepo}"
    ./autogen.sh
    ./configure --enable-all-modules --prefix=/usr
    make || return 1
}

package() {
    cd "${srcdir}/${_hgrepo}"
    for e in clock comment info_msgcount killpresence lastmsg; do
        install -Dm755 ${e}/.libs/lib${e}.so  ${pkgdir}/usr/lib/mcabber/lib${e}.so
        install -Dm755 ${e}/.libs/lib${e}.lai ${pkgdir}/usr/lib/mcabber/lib${e}.la
    done
    install -Dm755 extsay-ng/.libs/libextsay.so  ${pkgdir}/usr/lib/mcabber/libextsay.so
    install -Dm755 extsay-ng/.libs/libextsay.lai ${pkgdir}/usr/lib/mcabber/libextsay.la
    install -Dm644 extsay-ng/README    ${pkgdir}/usr/share/mcabber/doc/HOWTO_extsay.txt
    install -Dm755 extsay-ng/extsay.sh ${pkgdir}/usr/share/mcabber/example/extsay.sh
}
