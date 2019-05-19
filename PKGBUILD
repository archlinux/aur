# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Hugo Arpin ("harpin")
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
optdepends=('libieee1284: libcd64 enhancements')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)
sha256sums=('c99964060a5337cea811b27c4103e186a14ba1f04b19cff08bac0260271bc872')
source+=(fix_makefile_cflags.diff)
sha256sums+=('8f1532c4c35b98af34b3c1dc3bdeaa6c2183c7927be69ce396895491d7e8feff')
source+=(fix_libcd64_libieee1284.diff)
sha256sums+=('19efc5d87c07c11797fba657f25619c70fa175d100688eafd1094d14baad1255')

srcroot="${pkgname}-${pkgver}-src/"

prepare()
{
    echo "Applying Makefile CFLAGS fix"
    patch -d "${srcroot}" -p1 < "../fix_makefile_cflags.diff"

    # Thanks harpin from the aur forums for pointing this bug out!
    echo "Applying libcd64 ieee1284 shared library fix"
    patch -d "${srcroot}" -p1 < "../fix_libcd64_libieee1284.diff"
}

build() 
{
    cd "${srcroot}/src"
    ./configure --prefix=/usr --with-libusb --with-libcd64
    make
}

package() 
{
    cd ${pkgname}-${pkgver}-src/src

    install -Dm775 ucon64 "${pkgdir}"/usr/bin/ucon64
    install -Dm755 libdiscmage/discmage.so "${pkgdir}"/usr/lib/discmage.so
}
