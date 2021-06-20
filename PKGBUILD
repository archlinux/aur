# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada_spawn
pkgver=r69.725a42d
pkgrel=1
pkgdesc="A simple Ada API to spawn processes and communicate with them."
arch=('x86_64')
url="https://github.com/AdaCore/spawn"
license=('GPL3' 'custom')
makedepends=('git' 'gcc-ada' 'gprbuild')
source=("git+https://github.com/AdaCore/spawn.git#commit=725a42d9511ac414147dc9d7a2e16a6743e0f779"
        "Makefile.patch")
sha1sums=(SKIP
          b77624236aa8988085ae6bddd4ca18c5d2e11cb8)

pkgver() {
    cd "$srcdir/spawn"
    printf "r%s.%s"                        \
           "$(git rev-list  --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/spawn"
   patch -Np1 -i ../Makefile.patch
}

build() {
   cd "$srcdir/spawn"
   export OS=unix
   make all
}

package() {
   cd "$srcdir/spawn"

   export OS=unix
   DESTDIR=$pkgdir make install

   # Rid duplicated '.ali' files.
   rm $pkgdir/usr/lib/spawn/spawn-environments.ali
   rm $pkgdir/usr/lib/spawn/spawn-internal__posix.ali
   
   DESTDIR=$pkgdir make install-glib
 
   # Install the license.
   install -D -m644     \
      "COPYING3" \
      "$pkgdir/usr/share/licenses/ada_spawn/COPYING3"

   # Install the custom license.
   install -D -m644     \
      "COPYING.RUNTIME" \
      "$pkgdir/usr/share/licenses/ada_spawn/COPYING.RUNTIME"
}
