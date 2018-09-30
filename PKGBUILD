# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
pkgver=2018
pkgrel=2
pkgdesc="GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')

depends=("clang" "libadalang>=2018"
         "gnatcoll-xref>=2018" "gnatcoll-python>=2018" "gnatcoll-db2ada>=2018"
         "gnatcoll-gnatinspect>=2018" "gtkada>=2018"
         "gnome-icon-theme" "gnome-icon-theme-extras" "gnome-icon-theme-symbolic" 
         "python2-gobject" "python2-jedi")
makedepends=("gprbuild>=2018")

source=(http://mirrors.cdn.adacore.com/art/5b0cf627c7a4475261f97ceb
        http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a59
        patch-Makefile.in
        patch-docs-Makefile.in)
sha1sums=('c6e883cdadb96d274906674b8697652e66ff8201'
          '034e5443a94336f6aca020c916ddf8f30598f8bf'
          '763584d9a931887eff11151310504c02df279224'
          '60813145324cd5ea9f081648da10cffd99f87586')

prepare()
{
  cd $srcdir/gps-gpl-2018-src

  patch -p0 -i ../patch-Makefile.in
  patch -p0 -i ../patch-docs-Makefile.in

  ## Force use of python2
  #
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config

  ## Move lal-tools into the GPS source tree.
  #
  mv $srcdir/libadalang-tools-src $srcdir/gps-gpl-2018-src/laltools
}

build() 
{
  cd $srcdir/gps-gpl-2018-src

  export OS=unix

  ## Force use of python2
  #
  export PATH=$srcdir/gps-gpl-2018-src/temp_bin:$PATH
	
  ./configure  --prefix=/usr
  make
}



package() 
{
  cd $srcdir/gps-gpl-2018-src

  export OS=unix

  ## Force use of python2
  #
  export PATH=$srcdir/gps/temp_bin:$PATH

  make DESTDIR="$pkgdir/" install
}
