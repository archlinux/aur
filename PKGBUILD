# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Maintainer: Alberto Ronzani ("albron") <alberto.ronzani@gmail.com>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=dfhack
pkgver=0.47.05
_pkgver=$pkgver-r7
pkgrel=10
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="https://dfhack.readthedocs.io/en/stable/"
license=('custom')
# ruby will be removed upstream so libxcrypt-compat dependency may soon go too
depends=("dwarffortress=$pkgver" lua protobuf libpng12 libxrandr libjpeg6 freetype2 libglvnd libxcursor libxinerama libxcrypt-compat)
makedepends=('cmake' 'git' 'python-sphinx' 'perl-xml-libxml' 'perl-xml-libxslt')
conflicts=('dfhack-bin' 'dfhack-git')

source=("$pkgname::git+https://github.com/DFHack/dfhack#tag=$_pkgver"
        dfhack.sh
        dfhack-run.sh
        Wno-restrict.patch)

md5sums=('SKIP'
         '45ab3b65cb5b01beff9fecccff777f85'
         '37421a6cf2ca420bed4420ea8e402d40'
         '086fc32900f4c6589a06ac1c7acc6e98')

prepare() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname || exit 1

  git remote set-url origin https://github.com/DFHack/dfhack
  git submodule sync
  git submodule update --init

  cd "$srcdir/$pkgname"
  # gcc issue - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105329
  patch --strip=1 --input="${srcdir}/Wno-restrict.patch"
}

build() {
  cd "$srcdir"/$pkgname/build || exit 1

  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/dwarffortress \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DOCS=ON \
    -DBUILD_STONESENSE=ON \
    -DDFHACK_BUILD_ARCH=64 \
    ..

  make
}

package() {
  cd "$srcdir"/$pkgname/build || exit 1

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install

  install -Dm755 "$srcdir"/dfhack.sh     "$pkgdir"/usr/bin/dfhack
  install -Dm755 "$srcdir"/dfhack-run.sh "$pkgdir"/usr/bin/dfhack-run

  install -Dm644 ../LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
