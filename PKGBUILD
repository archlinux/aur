# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=asis
pkgver=2016
pkgrel=1
pkgdesc="Allows Ada programs access to the syntactic and semantic structure of source code. Also provides extra tools such as gnatpp."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/$_pkgname
license=(GPL)
groups=(gcc-ada)

depends=(gcc-ada gnat_util gnatcoll)

provides=($pkgname)
conflicts=($pkgname)

source=(http://downloads.dragonlace.net/src/$pkgname-gpl-$pkgver-src.tar.gz
        asis.gpr
        patch-Makefile
        patch-Makefile.stub
        patch-a4g-encl_el.adb
        patch-a4g-a_opt.ads
        patch-a4g-a_opt.adb)

md5sums=('2c5a1f382bbf644bcdd2e6417f6d1e60'
         '223d59aadef66852e7f0493bf6b01fee'
         '223d59aadef66852e7f0493bf6b01fee'
         '91e1338160c413a06031a547b4f84338'
         '4608269e4e5bdd57cf8eabb2dc5c0041'
         '4608269e4e5bdd57cf8eabb2dc5c0041'
         '210cbc83474488ebcfd9b72d1ccc3e43')


prepare()
{
    WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src

    sed -i  -e 's|OPSYS|ASISOPSYS|g'              \
            -e 's|(prefix)|(DESTDIR)$$(prefix)|g' \
            ${WRKSRC}/Makefile                    \
            ${WRKSRC}/Makefile.stub               \
            ${WRKSRC}/common.gpr

    rm -rf  ${WRKSRC}/gnat

    cd $WRKSRC
    patch -p0 -i ../patch-Makefile
    patch -p0 -i ../patch-Makefile.stub
    patch -p0 -i ../patch-a4g-a_opt.ads
    patch -p0 -i ../patch-a4g-a_opt.adb
    patch -p0 -i ../patch-a4g-encl_el.adb
}



build() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    make all
    make tools
}

    

package() 
{
    cd $srcdir/$pkgname-gpl-$pkgver-src

    PREFIX=/usr  make install       prefix=${pkgdir}/usr
    PREFIX=/usr  make install-tools prefix=${pkgdir}/usr
}
