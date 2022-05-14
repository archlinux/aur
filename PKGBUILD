# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada_spawn
epoch=1
pkgver=22.0.0
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

source=("https://github.com/AdaCore/spawn/archive/refs/tags/v22.0.0.tar.gz"
        "Makefile.patch")
sha256sums=(c1a02dac68dd84f18d4cacd4710310ae7d29b83f66a02dd8976d534f369cd769
            fd4af51cd1eaf12040475425276eb4c5df17b46b948154c3babfae5d0710b105)

prepare()
{
   cd "$srcdir/spawn-$pkgver"
   patch -Np1 -i ../Makefile.patch
}

build()
{
   cd "$srcdir/spawn-$pkgver"

   export OS=unix
   export SPAWN_WARN_ERRORS=false
   make all
}

package()
{
   cd "$srcdir/spawn-$pkgver"

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