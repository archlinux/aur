# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada_spawn
epoch=1
pkgver=21.0.0
pkgrel=1

pkgdesc="A simple Ada API to start processes and communicate with them."
url="https://github.com/AdaCore/spawn"

arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gtkada')           # 'namcap' says gtkada dependency is not needed, yet it is needed to supply the ada glib binding.
makedepends=('gprbuild')

_name=spawn
_version=2021-20210701-19A43-src
_hash=28342768afab1e644a660b96051c04e5e9d3bcb0

source=("$pkgname-$pkgver.tar.gz::https://community.download.adacore.com/v1/$_hash?filename=$pkgname-$_version.tar.gz&rand=1809"
        "Makefile.patch")
sha1sums=($_hash
          b77624236aa8988085ae6bddd4ca18c5d2e11cb8)

prepare()
{
   cd "$srcdir/$_name-$_version"
   patch -Np1 -i ../Makefile.patch
}

build()
{
   cd "$srcdir/$_name-$_version"
   export OS=unix
   make all
}

package()
{
   cd "$srcdir/$_name-$_version"

   export OS=unix
   DESTDIR=$pkgdir make install

   # Rid duplicated '.ali' files.
   rm $pkgdir/usr/lib/spawn/spawn-environments.ali
   rm $pkgdir/usr/lib/spawn/spawn-internal__posix.ali
   
   DESTDIR=$pkgdir make install-glib
 
   # Install the license.
   install -D -m644     \
      "COPYING3" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

   # Install the custom license.
   install -D -m644     \
      "COPYING.RUNTIME" \
      "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
