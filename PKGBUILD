# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnatcoll
pkgver=gpl2016
pkgrel=1
pkgdesc="Provides components to complement the Ada & GNAT libraries (string/text, memory management, file handling, etc)."

arch=('i686' 'x86_64')
url="http://libre.adacore.com/tools/gnat-component-collection"
license=('GPL')

depends=("gcc-ada" "xmlada" "gtkada" "gprbuild" "gnat_util" "libgpr" "python2" "python2-pycodestyle" "python2-jedi" "python2-gobject")
makedepends=("nawk")

source=(http://mirrors.cdn.adacore.com/art/5739942ac7a447658d00e1e7
        patch-gnatcoll_full.gpr
        patch-Makefile
        patch-gnatcoll-scripts.ads
        patch-gnatcoll-scripts.adb
        patch-gnatcoll-projects-normalize.adb);

sha1sums=('921c17e7dcb2cc00e4fe0f58d34896ed1d11fc5e'
          'd9b99596d69800aa5ad0d107a456195e1fdd7bc2'
          '80d6204a1ac0040f867184dfea75cc2988ba05da'
          'bcb378d479bf88343e2c6ec8beb599287c0f7139'
          '3f58009f5d7188addc50e65ae5fb18b07f03f52c'
          '5eb0af7dd112d949653b10a2345cb27e0ebc0f0a')


prepare()
{
  cd $srcdir/gnatcoll-gpl-2016-src

  patch -p0 -i ../patch-gnatcoll_full.gpr
  patch -p0 -i ../patch-Makefile
  patch -p0 -i ../patch-gnatcoll-scripts.ads
  patch -p0 -i ../patch-gnatcoll-scripts.adb
  patch -p0 -i ../patch-gnatcoll-projects-normalize.adb
}



build() 
{
  export OS=unix
  export Build=Production
	
  cd $srcdir/gnatcoll-gpl-2016-src

  ## Force use of python2.
  #
  rm -fr $srcdir/temp_bin
  mkdir  $srcdir/temp_bin
  ln -s /usr/bin/python2         $srcdir/temp_bin/python
  ln -s /usr/bin/python2-config  $srcdir/temp_bin/python-config
  export PATH=$srcdir/temp_bin:$PATH

  AWK=/usr/bin/nawk  ./configure  --prefix=/usr  --disable-shared

  ADA_PROJECT_PATH=/usr/lib/gnat make PROCESSORS=3

  ls obj -alh
  cp src/obj/gnatcoll_db2ada .
  cp src/obj/gnatinspect     .
}



package() 
{
  cd $srcdir/gnatcoll-gpl-2016-src

  ## Force use of python2.
  #
  rm -fr $srcdir/temp_bin
  mkdir  $srcdir/temp_bin
  ln -s /usr/bin/python2         $srcdir/temp_bin/python
  ln -s /usr/bin/python2-config  $srcdir/temp_bin/python-config
  export PATH=$srcdir/temp_bin:$PATH

  make DESTDIR="$pkgdir/" prefix=$pkgdir/usr install 

  cp src/dborm.py        $pkgdir/usr/share/gnatcoll

  mkdir -p $pkgdir/usr/bin
  cp gnatcoll_db2ada $pkgdir/usr/bin
  cp gnatinspect     $pkgdir/usr/bin
}
