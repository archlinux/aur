# Maintainer:  Rod Kay            <charlie5 on #ada at irc.libera.chat>

# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnatstudio
pkgdesc='GNAT Programming Studio for Ada.'
pkgver=26.0w
pkgrel=1
epoch=1

arch=(i686 x86_64)
url=https://github.com/AdaCore/gps
license=(GPL)

conflicts=(gnat-gps gnatstudio-bin)

depends=(clang
         ada_language_server
         gnatcoll-python
         gnatcoll-xref
         gnatcoll-db2ada
         gtkada
         python-gobject
         python-cairo
         python-yaml
         python-jedi
         python-pycodestyle
         python-sphinx_rtd_theme)

makedepends=(gprbuild
             texlive-meta
             graphviz)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/gnatstudio-26.0w-20250417-16207-src.tar.gz
        0003-Honour-DESTDIR-in-installation-targets.patch
        gs_utils.patch
        os-utils.c-patch
        building_executable_programs_with_gnat.rst
        gps.desktop
        rid_failing_test_for_gtkada_in_configure.ac-patch)

sha256sums=(0e1afdb2088447178ee0a634c29f5f52100fc7070cb166427520081e9400048e
            5607c451dbf63dba346eeb2ef602a86321d310bdfb6ef777870bb32761b596d5
            7f5196621ca8f1dfe15ada96af63b10d70a56727c103459864a0e3f6b510d182
            6626d93c5d0016280a31411a3dcc5ec80fd1a69c85f4c48a1334ae3f950008b2
            f29080c1d283929cedaa630df27d1688b2099ab5f82601fbf98028a528e935ae
            e21894fc1a0fbc90c25b0c524969703d685f283adc09225744d9013de3b00533
            9d454434aecbc6bb6ce70985feabb97417291c831ae0ac4deec69a5b79fe722f)


prepare()
{
   cd $srcdir/gnatstudio-26.0w-20250417-16207-src
   
   patch -p1 < $srcdir/0003-Honour-DESTDIR-in-installation-targets.patch
#   patch -p0 < $srcdir/gs_utils.patch
#   patch -p0 < $srcdir/os-utils.c-patch
   patch -Np0 -i $srcdir/rid_failing_test_for_gtkada_in_configure.ac-patch

   cp $srcdir/building_executable_programs_with_gnat.rst gnat
}


build() 
{
   cd $srcdir/gnatstudio-26.0w-20250417-16207-src

   export OS=unix
   export LC_ALL=C
   
   autoconf
   ./configure --prefix=/usr

   # The release tarball contains a bunch of sphinx build artefacts.
   #
   make -C docs clean

   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   # GPS uses a lot of Unchecked_Conversion (too many to patch), so we have to build with -fno-strict-aliasing.
   # https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gnat_ugn/Optimization-and-Strict-Aliasing.html
   #
   make OS=unix                  \
        PROCESSORS=0             \
        BUILD=Production         \
        PRJ_BUILD=Release        \
        LIBRARY_TYPE=relocatable \
        GPRBUILD_FLAGS="-R -cargs $ADA_FLAGS -fno-strict-aliasing -largs $LDFLAGS -lpython3.13 -gargs"
 
   # Gnatdoc appears broken when trying to build docs. Disabling docs til fixed.
   #  
#   make -C docs all
}


package() 
{
   cd $srcdir/gnatstudio-26.0w-20250417-16207-src
   
   export OS=unix
   
   make DESTDIR=$pkgdir         install
#   make DESTDIR=$pkgdir -C docs install
 
   ln -s /usr $pkgdir/usr/share/gnatstudio/python

   # Add the desktop config.
   #
   install -Dm644 -t $pkgdir/usr/share/applications/ $srcdir/gps.desktop
  
   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3
}