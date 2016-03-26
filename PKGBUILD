# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnatcoll
pkgver=gpl2015
pkgrel=1
pkgdesc="Provides components to complement the Ada & GNAT libraries (string/text, memory management, file handling, etc)."

arch=('i686' 'x86_64')
url="http://libre.adacore.com/tools/gnat-component-collection"
license=('GPL')

depends=("gcc-ada" "xmlada" "gtkada" "gprbuild" "gnat_util" "python2" "python2-pep8" "python2-jedi" "python2-gobject")
makedepends=("nawk")

source=(http://mirrors.cdn.adacore.com/art/564b3e2ec8e196b040fbd140
        patch-python_support_gtk.c)

md5sums=('bc70aaf2e21a488a00f87fdec112454a'
         '59ceebb56df53b2b35f97ff3f0df5df4')



prepare()
{
  cd $srcdir/gnatcoll-gpl-2015-src
  patch -p0 -i ../patch-python_support_gtk.c
}



build() 
{
  export OS=unix
  export Build=Production
	
  cd $srcdir/gnatcoll-gpl-2015-src

  ## Force use of python2.
  #
  rm -fr $srcdir/temp_bin
  mkdir  $srcdir/temp_bin
  ln -s /usr/bin/python2         $srcdir/temp_bin/python
  ln -s /usr/bin/python2-config  $srcdir/temp_bin/python-config
  export PATH=$srcdir/temp_bin:$PATH

  AWK=/usr/bin/nawk  ./configure  --prefix=/usr

  ADA_PROJECT_PATH=/usr/lib/gnat make PROCESSORS=3
}



package() 
{
  cd $srcdir/gnatcoll-gpl-2015-src

  ## Force use of python2.
  #
  rm -fr $srcdir/temp_bin
  mkdir  $srcdir/temp_bin
  ln -s /usr/bin/python2         $srcdir/temp_bin/python
  ln -s /usr/bin/python2-config  $srcdir/temp_bin/python-config
  export PATH=$srcdir/temp_bin:$PATH

  make DESTDIR="$pkgdir/" install
}
