# Maintainer: Rod Kay   <charlie5 on #ada at irc.libera.chat>

pkgname=aunit
epoch=1
pkgver=25.0.0
pkgrel=1
pkgdesc='Ada unit testing framework.'

arch=(x86_64 aarch64)
url='https://github.com/AdaCore/aunit'
license=(GPL-3.0-only custom)

depends=(gcc-ada)
makedepends=(gprbuild
             python-sphinx_rtd_theme)

source=(https://github.com/AdaCore/aunit/archive/refs/tags/v$pkgver.tar.gz
        aunit.gpr.patch)
sha256sums=(6468914556c95504e9aed1dd81a1fc9969e56416bd3bb25dd3bae3905f35d379
            81b5f79ae62d43fbb1867059ed448dd88b1475d32ab902a0cabd77a11c330b9e)

_pkg_src_dir=$pkgname-$pkgver


prepare()
{
   cd $srcdir/$_pkg_src_dir

   patch -Np0 -i $srcdir/aunit.gpr.patch
}


build()
{
   cd $srcdir/$_pkg_src_dir

   make
   make -C doc all                 \
        1> build_docs-warnings.log \
        2> build_docs-errors.log
}


package()
{
   cd $srcdir/$_pkg_src_dir

   make INSTALL=$pkgdir/usr install

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
