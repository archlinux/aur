# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Hugo Arpin ("harpin")
# Contributor: Paula Breton <paula@parashep.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ucon64
pkgver=2.2.1
pkgrel=2
pkgdesc="A ROM backup tool and emulator's Swiss Army knife program." 
arch=('i686' 'x86_64')
url="https://ucon64.sourceforge.io/index.php"
license=('GPL')
depends=('zlib' 'libusb-compat')
optdepends=('libieee1284: libcd64 enhancements')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)
sha256sums=('e814f427a59866e16fe757bf4af51004ac68be29cabd78944590878f1df73f79')

# Apply a minor patch affecting 64-bit systems, the bug of which was found
# just a few days after the release of 2.2.1. It won't be needed in the next
# release.
source+=(https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-${pkgver}/patches/change_mem2.patch)
sha256sums+=('65ff85255878e077c2e5fc57565cf0b93833ce8ac03bf81d46ba91ec837accf7')

srcroot="${pkgname}-${pkgver}-src/src"

prepare()
{
    patch -d "${srcdir}" -p2 < ../aur_discmage_path.patch

    # XXX Remember to remove this patch on the next release (>2.2.1)
    patch -d "${srcdir}" -p0 < change_mem2.patch
}

build() 
{
    cd "$srcroot"
    export CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2"
    ./configure --prefix=/usr --with-libusb --with-libcd64 --with-libdiscmage
    make
}

package() 
{
    cd "$srcroot"

    install -Dm775 ucon64 "${pkgdir}"/usr/bin/ucon64
    install -Dm755 libdiscmage/discmage.so "${pkgdir}"/usr/lib/discmage.so
}
