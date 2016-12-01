# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=lib32-stderred-git
_gitname=stderred
pkgver=v1.0.r30.gab40b5f
pkgrel=5
pkgdesc="LD_PRELOAD hack to color stderr output red"
arch=(x86_64)
url="https://github.com/sickill/stderred"
license=(MIT)
source=(git+https://github.com/sickill/stderred)
depends=(lib32-glibc)
provides=(lib32-stderred)
conflicts=(lib32-stderred)
makedepends=(git cmake gcc-multilib)
md5sums=(SKIP)
optdepends=('bash: to use the convenience script')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # We need to patch some files so as not to conflict with non-lib32.
    cd "$_gitname"
    sed -i 's|DESTINATION lib|DESTINATION "${LIBDIR}"|' src/CMakeLists.txt
    sed 's|stderred\.sh|stderred32.sh|' usr/bin/stderred >usr/bin/stderred32
    sed 's|lib/|lib32/|' usr/share/stderred/stderred.sh >usr/share/stderred/stderred32.sh
}

build() {
  cd "$srcdir/$_gitname"

  [ -d build32 ] || mkdir build32
  pushd build32
  CFLAGS="$FLAGS -m32" cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=lib32 ../src
  make
  popd
}

package() {
  cd "$_gitname"/build32
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/$_gitname"/README.md "$pkgdir"/usr/share/doc/stderred/README-stderred32.md
  install -D "$srcdir/$_gitname"/LICENSE "$pkgdir"/usr/share/licenses/lib32-stderred-git/LICENSE
  install -D "$srcdir/$_gitname"/usr/bin/stderred32 "$pkgdir"/usr/bin/stderred32
  install -D "$srcdir/$_gitname"/usr/share/stderred/stderred32.sh "$pkgdir"/usr/share/stderred/stderred32.sh
}
