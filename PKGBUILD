# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnat-gps
pkgver=6.1.1
pkgrel=1
pkgdesc="GPS, the GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')
depends=("gcc-ada" "xmlada" "gtkada" "gprbuild" "python2")
makedepends=("nawk")
rundepends=("python2-pep8" "python2-jedi" "python2-gobject")

source=(http://mirrors.cdn.adacore.com/art/eabc020e818b1c6b8a6dc5ea3f665a479a49bb14
        http://mirrors.cdn.adacore.com/art/8c386e54b4411aeb49e7786fa403f9caa28b6d91
        patch-Makefile.in
        patch-docs-Makefile.in)


md5sums=('c690ecf9dc58384cf52ed8ce81e9cb5a'
         'bc70aaf2e21a488a00f87fdec112454a'
         'a1784ff68b633c019666d7e176f9b2ef'
         'b47f71e78c77885bd05f031a36932bbd')



prepare()
{
  cd $srcdir/gps-$pkgver-src

  patch -p0 -i ../patch-Makefile.in
  patch -p0 -i ../patch-docs-Makefile.in
}



build() 
{
  export OS=unix
  export Build=Production
	
  cd $srcdir/gps-$pkgver-src


  ln -s  $srcdir/gnatcoll-gpl-2015-src  gnatlib

  find -name '*.gpr'    -print -exec sed -i.bak 's/-fdump-xref//g' {} \;
  find -name '*.gpr.in' -print -exec sed -i.bak 's/-fdump-xref//g' {} \;

#  patch -p0 -i ../patch-browsers_src_browsers-scripts.adb
#  patch -p0 -i ../patch-Makefile.in
#  patch -p0 -i ../patch-docs_Makefile.in


  AWK=/usr/bin/nawk PYTHON=/usr/bin/python2 ./configure --prefix=/usr

  ADA_PROJECT_PATH=/usr/lib/gnat make
}



package() 
{
  cd $srcdir/gps-$pkgver-src

#  rm -fr $srcdir/temp_bin
#  mkdir  $srcdir/temp_bin
#  ln -s /usr/bin/python2 $srcdir/temp_bin/python
#  export PATH=$srcdir/temp_bin:$PATH

  PYTHON=/usr/bin/python2  DESTDIR=$pkgdir  make install 
}
