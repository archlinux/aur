# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
pkgver=2019
pkgrel=1
pkgdesc="GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')

depends=("clang" "libadalang"
         "gnatcoll-xref" "gnatcoll-python" "gnatcoll-db2ada"
         "gnatcoll-gnatinspect" "gtkada"
         "gnome-icon-theme" "gnome-icon-theme-extras" "gnome-icon-theme-symbolic" 
         "python2-gobject" "python2-jedi")
makedepends=("gprbuild")

source=(https://github.com/AdaCore/gps/archive/3b331d05ecf8b0d0e76d0b264c8f5c4fa7bca3d3.zip
        http://mirrors.cdn.adacore.com/art/5cdf8f4e31e87a8f1d42509f
        patch-Makefile.in
        patch-docs-Makefile.in
        xref-docgen.adb-patch
        src_contexts.adb-patch)

sha1sums=('203427f62483f7fda557a0be4bac9045a55b351d'
          '6b32f1aa7cc443bcaf268ef13fa46e3b0fdf147d'
          '763584d9a931887eff11151310504c02df279224'
          '60813145324cd5ea9f081648da10cffd99f87586'
          'e166ed6513465f59f433eac8f759afcd190ab853'
          'bd80d0f84c128e1e0d6a1aa3ac4b419226a4c616')

gps_version="3b331d05ecf8b0d0e76d0b264c8f5c4fa7bca3d3"


prepare()
{
  cd $srcdir/gps-$gps_version

  patch -p0 -i ../patch-Makefile.in
  patch -p0 -i ../patch-docs-Makefile.in

  patch -p0 -i ../src_contexts.adb-patch
  patch -p0 -i ../xref-docgen.adb-patch

  ## Force use of python2
  #
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config

  ## Move lal-tools into the GPS source tree.
  #
  rm -fr $srcdir/gps-$gps_version/laltools
  mv $srcdir/libadalang-tools-2019-20190517-195C4-src $srcdir/gps-$gps_version/laltools
}


build() 
{
  cd $srcdir/gps-$gps_version

  export OS=unix

  ## Force use of python2
  #
  export PATH=$srcdir/gps-$gps_version/temp_bin:$PATH
	
  export Build=Production
  ./configure  --prefix=/usr
  PROCESSORS=5 make
}


package() 
{
  cd $srcdir/gps-$gps_version

  export OS=unix

  ## Force use of python2
  #
  export PATH=$srcdir/gps/temp_bin:$PATH

  make DESTDIR="$pkgdir/" install
}
