# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnat-gps
pkgver=2017
pkgrel=2
pkgdesc="GPS, the GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')

depends=("clang" "gnatcoll" "gtkada" "gnome-icon-theme" "gnome-icon-theme-extras" "gnome-icon-theme-symbolic")
makedepends=("libadalang")

source=(http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deed03b
        patch-Makefile.in
        patch-docs-Makefile.in)

sha1sums=('7d394bf2c74551b3084dcf624121344fb303f140'
          'SKIP'
          'SKIP')


prepare()
{
  cd $srcdir/gps-gpl-2017-src

  patch -p0 -i ../patch-Makefile.in
  patch -p0 -i ../patch-docs-Makefile.in

  ## Force use of pyhon2
  #
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config
}



build() 
{
  cd $srcdir/gps-gpl-2017-src

  ## Force use of pyhon2
  #
  export PATH=$srcdir/gps-gpl-2017-src/temp_bin:$PATH
	
  ./configure  --prefix=/usr

  PROCESSORS="$(nproc)" make
}



package() 
{
  cd $srcdir/gps-gpl-2017-src

  ## Force use of pyhon2
  #
  export PATH=$srcdir/gps/temp_bin:$PATH

  make DESTDIR="$pkgdir/" install
}
