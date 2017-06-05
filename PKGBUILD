# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnat-gps
pkgver=2017
pkgrel=1
pkgdesc="GPS, the GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')

depends=("clang" "gnatcoll" "gtkada")
makedepends=("libadalang")

source=(git+https://github.com/AdaCore/gps.git
        patch-Makefile.in)

md5sums=('SKIP'
         'SKIP')


prepare()
{
  cd $srcdir/gps

  patch -p0 -i ../patch-Makefile.in

  ## Force use of pyhon2
  #
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config
}



build() 
{
  export OS=unix
  export Build=Production

  export PATH=$srcdir/$pkgname/temp_bin:$PATH    
	
  cd $srcdir/gps

  ./configure  --prefix=/usr

  PROCESSORS=5  make -j5
}



package() 
{
  cd $srcdir/gps

  PYTHON=python2 make DESTDIR="$pkgdir/" install
}
