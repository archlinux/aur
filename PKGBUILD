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

source=(http://mirrors.cdn.adacore.com/art/57399029c7a447658e0aff71
        asis.gpr
        patch-Makefile
        patch-Makefile.stub
        patch-a4g-encl_el.adb
        patch-a4g-a_opt.ads
        patch-a4g-a_opt.adb)

sha1sums=('25195ea826bb1c790c8f3acfd1971b5fa7772109'
          '16101754d8a8887625d15d2ee97ad2ef9b4cd9c7'
          '46de83b7fa14aa884eb0f066970f3250a629d28f'
          'b359b5945dafda8d30f0a6e7265a975e250e5af3'
          '6e29d9f5f24d378ae91db783b97776c0069c0d17'
          '3c3918f9ef569f783da0cbf55884629051b84b61'
          '390c688eb0cca14339a6178213bc6a47ffcec02b')


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
