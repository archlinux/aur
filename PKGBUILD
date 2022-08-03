# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
epoch=1
pkgver=22.0.0
pkgrel=3

pkgdesc="A high level string and text processing library for Ada."
url="https://github.com/AdaCore/VSS"

arch=('i686' 'x86_64')
license=('GPL3' 'custom')

makedepends=('gprbuild')
         
source=("https://github.com/AdaCore/VSS/archive/refs/tags/v22.0.0.tar.gz"
        "patch-Makefile")
sha256sums=(eddccea4b109ce67f13c92937e59e5ae00a93244c8c05b1234c7b6413451f24e
            a6f9feb705fe503021497eb4b453650312e89f50580a55e986c1642da7a05381)

prepare()
{
  cd "$srcdir/VSS-22.0.0"

  patch -p0 -i ../patch-Makefile
  mv source/regexp/vss-regular_expressions-utilities.ads source/regexp/vss-regular_expressions-utilities.ads-orig
}

build()
{
   cd "$srcdir/VSS-22.0.0"
   make all
}

package()
{
   cd "$srcdir/VSS-22.0.0"

   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_json.gpr
   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_text.gpr
   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_gnat.gpr
   gprinstall -p --prefix="$pkgdir/usr" gnat/vss_regexp.gpr

   # Install the license.
   install -D -m644     \
      "COPYING3"        \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

   # Install the custom license.
   install -D -m644     \
      "COPYING.RUNTIME" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
