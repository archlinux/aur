# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
pkgdesc='Gnat components collection - Core packages.'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/gnatcoll-core'
arch=(x86_64 aarch64)
license=(GPL-3.0 custom)

depends=(libgpr)
makedepends=(gprbuild-toolbox
             python-sphinx
             python-sphinx_rtd_theme
             texlive-meta)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/gnatcoll-core-src.tar.gz)
sha256sums=(040986aa04626e6f253840bee4c30b219974e72a2f604ed29779e3588122d392)

_gnatcoll_core_src=gnatcoll-core-27.0w-20260324-16311-src


build()
{
   cd $srcdir/$_gnatcoll_core_src

   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   make -j1 BUILD=PROD GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

   make -C docs html latexpdf      \
        1> build-docs-warnings.log \
        2> build-docs-errors.log
}


package()
{
   cd $srcdir/$_gnatcoll_core_src

   # Make one install at a time to avoid GPRinstall reading/writing to
   # the same installed project files at the same time.
   #
   make -j1 prefix=$pkgdir/usr install

   # Install the documentation.
   #
   mkdir -p $pkgdir/usr/share/doc/$pkgname

   cp -r docs/_build/html               $pkgdir/usr/share/doc/$pkgname
   cp    docs/_build/latex/GNATColl.pdf $pkgdir/usr/share/doc/$pkgname

   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3

   # Install the custom license.
   #
   install -D -m644   \
      COPYING.RUNTIME \
      $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
