# Maintainer: Rod Kay <rodakay5 at gmail dot com>

epoch=1

pkgname=ada-libfswatch
pkgver=24.0w
pkgrel=1
pkgdesc='An Ada binding to the libfswatch library in the fswatch project.'

url=https://github.com/AdaCore/ada_libfswatch
arch=(x86_64)
license=(GPL3 custom)

depends=(fswatch gnatcoll-core)
makedepends=(gprbuild)

_repo_name=ada_libfswatch
_source_dir=$_repo_name-$pkgver-20230428-16626-src

source=(file:///opt/gnatstudio-sources/$_repo_name-$pkgver-20230428-16626-src.tar.gz
        0001-Use-system-libfswatch-install.patch
        0002-Build-dynamic-library.patch
        0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch)

sha256sums=(08a65c7bac9cabb36b26275cda41bc056a1c2d26bdfbd0dbc63761fc90067f86
            a1947e1d8b0f0449d196d422d0a2fd038fd8aa6e0abdd533cf71dbece901492b
            904c986f2cb67744f8799ec7770f73f3f893713d0ccc5f4c552d8d9a3cc9dae8
            53dc07cbb68b3ddfdb3133b0c2edb9878818fcba54d2f1dbc70b8821cf42d1cf)


prepare()
{
   cd $srcdir/$_source_dir

   patch -p1 < $srcdir/0001-Use-system-libfswatch-install.patch
   patch -p1 < $srcdir/0002-Build-dynamic-library.patch
   patch -p1 < $srcdir/0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch
}


build()
{
   cd $srcdir/$_source_dir

   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   make GPRBUILD_FLAGS="-vh -R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
}


package()
{
   cd $srcdir/$_source_dir

   OS=unix \
   make install DESTDIR=$pkgdir/usr

   # 'gprinstall' installs a soft link for '/usr/lib/libfswatch.so' 
   # which is already owned by fswatch, so remove it.
   #
   rm "$pkgdir/usr/lib/libfswatch.so"

   # Install the license.
   #
   install -D -m644     \
      COPYING3          \
      $pkgdir/usr/share/licenses/ada-libfswatch/COPYING3

   # Install the custom license.
   #
   install -D -m644     \
      COPYING.RUNTIME   \
      $pkgdir/usr/share/licenses/ada-libfswatch/COPYING.RUNTIME
}