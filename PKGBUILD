# Maintainer:  xiretza            <xiretza+aur@gmail.com>
# Maintainer:  Rod Kay            <charlie5 on #ada at freenode.net>

# Contributor: Patrick Kelly      <kameo76890 at gmail dot com>
# Contributor: Georgios Tsalikis  <aliverius somewhere near tsalikis and a net>

pkgname=gnatstudio
pkgdesc='GNAT Programming Studio for Ada.'
pkgver=24.0w
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
         python-yaml)

makedepends=(gprbuild
             texlive-latexextra
             graphviz)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230428-16588-src.tar.gz
        0003-Honour-DESTDIR-in-installation-targets.patch
        patch-dap.gpr
        gps.desktop)

sha256sums=(ae17d963f063657fe665be243362eccb6b3f122fe846fe64dd1270775120fb52
            5607c451dbf63dba346eeb2ef602a86321d310bdfb6ef777870bb32761b596d5
            b4701fa61cdd64f2fb689e68de06e209d2bb809fd5d98d81d9ccd7a77c6caff8
            e21894fc1a0fbc90c25b0c524969703d685f283adc09225744d9013de3b00533)


prepare()
{
   cd $srcdir/$pkgname-$pkgver-20230428-16588-src

   patch -p1 < $srcdir/0003-Honour-DESTDIR-in-installation-targets.patch
   patch -p0 < $srcdir/patch-dap.gpr
}


build() 
{
   cd $srcdir/$pkgname-$pkgver-20230428-16588-src

   export OS=unix

   ./configure --prefix=/usr

   # The release tarball contains a bunch of sphinx build artefacts.
   make -C docs clean
   make -C gnatdoc/docs/users_guide clean

   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   # GPS uses a lot of Unchecked_Conversion (too many to patch), so we have to build with -fno-strict-aliasing.
   # https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gnat_ugn/Optimization-and-Strict-Aliasing.html

   export BUILD=Production
   make -j32 OS=unix PROCESSORS=0 BUILD=Production PRJ_BUILD=Release LIBRARY_TYPE=relocatable GPRBUILD_FLAGS="-R -cargs $ADA_FLAGS -fno-strict-aliasing -largs $LDFLAGS -lpython3.11 -gargs"

#  make -C docs all     ### Docs are currently broken.
}


package() 
{
   cd $srcdir/$pkgname-$pkgver-20230428-16588-src

   export OS=unix
   make DESTDIR="$pkgdir/" install

   # Add the desktop config.
   #
   install -Dm644 -t $pkgdir/usr/share/applications/ $srcdir/gps.desktop
  
   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3
}