# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada_spawn
epoch=1
pkgver=23.0.0
pkgrel=1

pkgdesc="A simple Ada API to start processes and communicate with them."
url="https://github.com/AdaCore/spawn"

arch=('i686' 'x86_64')
license=('Apache')

depends=('gtkada')
makedepends=('gprbuild')

source=("https://github.com/AdaCore/spawn/archive/refs/tags/v$pkgver.tar.gz"
        "Makefile.patch")
sha256sums=(1487fef86433d1d06c5c3af3c012aac9eae8d2f4b7f8c1d2fdbe2be0b1770fa8
            23f7f6c71c5bcdef0f2258becdd39f4d86bb3f742ff73d08610118b467264343)


prepare()
{
   cd "$srcdir/spawn-$pkgver"
   patch -Np0 -i ../Makefile.patch
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

   LIBRARY_TYPE=relocatable \
   gprinstall -p --prefix="$pkgdir/usr" gnat/spawn_glib.gpr

   # Install the license.
   install -D -m644 \
      "LICENSE"     \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
