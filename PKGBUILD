# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>
# Contributor: Rod Kay            <charlie5 on #ada at freenode.net>

pkgname=gnat-gps
pkgver=2016
pkgrel=1
pkgdesc="GPS, the GNAT Programming Studio for Ada"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/libre/tools/gps"
license=('GPL')

depends=("gcc-ada" "clang" "xmlada" "gtkada" "gprbuild" "gnat_util" "python2" "python2-pep8" "python2-jedi" "python2-gobject" "gnatcoll")
makedepends=("nawk")

source=(http://mirrors.cdn.adacore.com/art/573996dec7a447658e0affaa
        patch-configure.in
        patch-Makefile.in
        patch-browser-scripts.adb
        patch-gps-cli_messages_windows.adb
        patch-gps-kernel-scripts.adb
        patch-gps-kernel.ads
        patch-gps-kernel.adb
        patch-gps-search-gui.adb
        patch-gps-scripts-commands.adb
        patch-toolchains-parsers.ads
        patch-toolchains-parsers.adb
        patch-diff_utils2.adb
        patch-vdiff2_module.adb
        patch-bookmark_views.adb
        patch-docs-Makefile.in)

md5sums=('4c3d9fd938605ac3b05b88b1fdad098d'
         '3d552208e8d668696b66aff9f097ca63'
         '8a5c28d26a81850f518e2b055ffcb748'
         '7bd3637e01dbe5600d2386e49ea5285f'
         '43afcdc81b29cf6fc02907828c3f4a3c'
         'a12200b29e34a90899dcf70f413a0a5d'
         'b57e5a92f4f3e3c18171b5e335b4f0a1'
         '7a266e6136ca4b6ea2a510e073d6ba69'
         'c2e4cad6abe38e78d3d1c044d9072b76'
         '53387d5a8ef8c4d4bc2865de8ecb0d4d'
         '59ea102ba0009b0864a537d601fa4d47'
         '725673980f344b66708c4b1fa95dca51'
         '59c2861ed0c269f58a454285336f4753'
         'eee87a819ab590813efe971ae81b6eac'
         'ea318985a7a2ba1b87c17acd16852558'
         'b47f71e78c77885bd05f031a36932bbd')


prepare()
{
  cd $srcdir/gps-gpl-$pkgver-src
  patch -p0 -i ../patch-configure.in
  patch -p0 -i ../patch-Makefile.in
  patch -p0 -i ../patch-browser-scripts.adb
  patch -p0 -i ../patch-gps-cli_messages_windows.adb
  patch -p0 -i ../patch-gps-kernel-scripts.adb
  patch -p0 -i ../patch-gps-kernel.ads
  patch -p0 -i ../patch-gps-kernel.adb
  patch -p0 -i ../patch-gps-search-gui.adb
  patch -p0 -i ../patch-gps-scripts-commands.adb
  patch -p0 -i ../patch-toolchains-parsers.ads
  patch -p0 -i ../patch-toolchains-parsers.adb
  patch -p0 -i ../patch-diff_utils2.adb
  patch -p0 -i ../patch-vdiff2_module.adb
  patch -p0 -i ../patch-bookmark_views.adb
  patch -p0 -i ../patch-docs-Makefile.in
}



build() 
{
  export OS=unix
  export Build=Production
	
  cd $srcdir/gps-gpl-$pkgver-src

  find -name '*.gpr'    -print -exec sed -i.bak 's/-fdump-xref//g' {} \;
  find -name '*.gpr.in' -print -exec sed -i.bak 's/-fdump-xref//g' {} \;


  ## Force use of python2.
  #
  rm -fr $srcdir/temp_bin
  mkdir  $srcdir/temp_bin
  ln -s /usr/bin/python2         $srcdir/temp_bin/python
  ln -s /usr/bin/python2-config  $srcdir/temp_bin/python-config
  export PATH=$srcdir/temp_bin:$PATH


  AWK=/usr/bin/nawk  ./configure  --prefix=/usr

  PROCESSORS=5  ADA_PROJECT_PATH=/usr/lib/gnat  make -j5
}



package() 
{
  cd $srcdir/gps-gpl-$pkgver-src

  ## Force use of python2.
  #
  rm -fr $srcdir/temp_bin
  mkdir  $srcdir/temp_bin
  ln -s /usr/bin/python2         $srcdir/temp_bin/python
  ln -s /usr/bin/python2-config  $srcdir/temp_bin/python-config
  export PATH=$srcdir/temp_bin:$PATH

  make DESTDIR="$pkgdir/" install
}
