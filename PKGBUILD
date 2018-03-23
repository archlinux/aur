# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Paula Breton <paula@parashep.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ucon64
pkgver=2.1.0
pkgrel=1
pkgdesc="A ROM backup tool and emulator's Swiss Army knife program. " 
arch=('i686' 'x86_64')
url="http://ucon64.sourceforge.net/index.php"
license=('GPL')
depends=('zlib' 'libusb-compat')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)
sha256sums=('c99964060a5337cea811b27c4103e186a14ba1f04b19cff08bac0260271bc872')

prepare()
{
    # This quickfix, which amends a typo in the Makefile resulting in
    # misinterpreting CFLAGS, was added by the previous maintainer.
    #
    # Here's an example of what happens without the end quotation, with a
    # CFLAGS variable containing spaces:
    #   
    # $ CFLAGS="-O2 -ggdb3" make
    # cd libdiscmage && CFLAGS=-O2 -ggdb3 LDFLAGS= make
    # /bin/sh: -ggdb3: command not found
    # make: *** [Makefile:243: libdiscmage/discmage.so] Error 127
    # $
    #
    # 
    sed -i 's|$(CFLAGS0)|"$(CFLAGS0)"|g' ${pkgname}-${pkgver}-src/src/Makefile
}

build() 
{
    cd ${pkgname}-${pkgver}-src/src
    ./configure --prefix=/usr --with-libusb --with-libcd64
    make
}

package() 
{
    cd ${pkgname}-${pkgver}-src/src

    install -Dm775 ucon64 "${pkgdir}"/usr/bin/ucon64
    install -Dm755 libdiscmage/discmage.so "${pkgdir}"/usr/lib/discmage.so
}
