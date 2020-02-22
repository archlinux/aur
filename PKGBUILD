# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>
# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnat-gps
pkgver=2019
pkgrel=2
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

source=(https://github.com/AdaCore/gps/archive/eb0d52567d9e1af49ee3248144442c9fa46bbb55.zip
        https://community.download.adacore.com/v1/6b32f1aa7cc443bcaf268ef13fa46e3b0fdf147d?filename=libadalang-tools-2019-20190517-195C4-src.tar.gz
        patch-Makefile.in
        patch-docs-Makefile.in
        xref-docgen.adb-patch
        src_contexts.adb-patch
        gps.desktop)

sha1sums=('ed71bc62dc796263a5ba91472be90067d71396cc'
          '6b32f1aa7cc443bcaf268ef13fa46e3b0fdf147d'
          '763584d9a931887eff11151310504c02df279224'
          '60813145324cd5ea9f081648da10cffd99f87586'
          'e166ed6513465f59f433eac8f759afcd190ab853'
          'bd80d0f84c128e1e0d6a1aa3ac4b419226a4c616'
          '1f4ee00408551af23eec12488188016ffee17c72')

gps_version="eb0d52567d9e1af49ee3248144442c9fa46bbb55"


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

  ## Add the desktop config.
  #
  mkdir -p               $pkgdir/usr/share/applications
  cp $srcdir/gps.desktop $pkgdir/usr/share/applications
}
