# Maintainer: Christopher Kobayashi <software+aur@disavowed.jp>

pkgname=x48
pkgver=0.6.4
pkgrel=3
pkgdesc="An HP 48 x/sx/g/gx Emulator"
arch=('i686' 'x86_64' 'aarch64')
url="http://sourceforge.net/projects"
license=(GPL3)
depends=(readline libxext)
makedepends=()

provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!emptydirs)
install=$pkgname.install
source=(source::${url}/${pkgname%-*}.berlios/files/${pkgname}-${pkgver}.tar.bz2/download
        sxrom.bz2::${url}/${pkgname%-*}.berlios/files/sxrom-d.bz2/download
        gxrom.bz2::${url}/${pkgname%-*}.berlios/files/gxrom-r.bz2/download)


md5sums=('700e631f8924a991b35d8a86ce60aab7'
         'a1adf17500c61774160afaa72894e936'
         'a08249c9a75d52671045dbb9c35321fa')

build() {
    aclocal
    autoheader
    automake --add-missing --copy -Wno-portability
    autoconf
    ./configure --prefix /usr
    sed -i '698s/inline/static inline/' src/emulate.c
    sed -i 's/-Werror=format-security/-Wformat-security/g' Makefile src/Makefile
    make
    bzcat gxrom.bz2 > gxrom
    bzcat sxrom.bz2 > sxrom
    
}

package() {
    install -Dm644 gxrom ${pkgdir}/usr/share/${pkgname}/gxrom
    install -Dm644 sxrom ${pkgdir}/usr/share/${pkgname}/sxrom
    make DESTDIR="$pkgdir/" install
    rm -r ${pkgdir}/usr/share/X11
}
