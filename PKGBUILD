# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-db2ada
pkgdesc='GNAT Components Collection - Tool to generate Ada code from database schemas.'
pkgver=26.0w
pkgrel=1
epoch=1

_repo_name=gnatcoll-db
_source_dir=gnatcoll-db-26.0w-20250416-16353-src

url=https://github.com/AdaCore/gnatcoll-db
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(gnatcoll-core gnatcoll-sql python)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gnatcoll-db-26.0w-20250409-16317-src.tar.gz)
sha256sums=(fe4367a13407bb0d300dda10fbca26ffd5fa9d13121625f37b38d998e728d649)


build()
{
    cd $srcdir/$_source_dir/gnatcoll_db2ada

    # Rid flags not used by Ada.
    #
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
    
  
    # Build documentation.
    #
    cd $srcdir/$_source_dir
    
    make -C docs html latexpdf      \
         1> build-docs-warnings.log \
         2> build-docs-errors.log 
}


package()
{
    cd $srcdir/$_source_dir/gnatcoll_db2ada

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    #
    make prefix=$pkgdir/usr install -j1


    # Install the documentation.
    #
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    
    cp -r ../docs/_build/html                  $pkgdir/usr/share/doc/$pkgname
    cp    ../docs/_build/latex/gnatcoll-db.pdf $pkgdir/usr/share/doc/$pkgname
    
    
    # Install the license.
    #
    install -D -m644 \
       "../COPYING3" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    #
    install -D -m644      \
       ../COPYING.RUNTIME \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}