# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-db2ada
pkgdesc='GNAT Components Collection - Tool to generate Ada code from database schemas.'
pkgver=27.0w
pkgrel=1
epoch=1

_repo_name=gnatcoll-db
_source_dir=gnatcoll-db-27.0w-20260324-165F4-src

url=https://github.com/AdaCore/gnatcoll-db
arch=(i686 x86_64)
license=(GPL3 custom)

depends=(gnatcoll-core gnatcoll-sql python)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gnatcoll-db-src.tar.gz)
sha256sums=(e78dae022a70f60ecbbee0e1a79b999d706fe078efa149b1664777293b1dfef8)


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