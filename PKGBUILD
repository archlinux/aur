# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=(stderred-git lib32-stderred-git)
_gitname=stderred
pkgver=v1.0.r30.gab40b5f
pkgrel=2
pkgdesc="LD_PRELOAD hack to color stderr output red"
arch=(i686 x86_64)
url="https://github.com/sickill/stderred"
license=(MIT)
source=(git+https://github.com/sickill/stderred)
makedepends=(git cmake)
md5sums=(SKIP)
optdepends=('bash: to use the convenience script')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # We need to patch some files to support a multilib-build.
    cd "$_gitname"
    sed -i 's|DESTINATION lib|DESTINATION "${LIBDIR}"|' src/CMakeLists.txt
    sed 's|stderred\.sh|stderred32.sh|' usr/bin/stderred >usr/bin/stderred32
    sed 's|lib/|lib32/|' usr/share/stderred/stderred.sh >usr/share/stderred/stderred32.sh
}

build() {
  cd "$srcdir/$_gitname"

  [ -d build ] || mkdir build
  pushd build
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=lib ../src
  make
  popd

  # Build lib32-.
  if [[ $CARCH == x86_64 ]]; then
    [ -d build32 ] || mkdir build32
    pushd build32
    CFLAGS="$FLAGS -m32" cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=lib32 ../src
    make
    popd
  fi
}

package_stderred-git() {
  depends=(glibc)
  provides=(stderred)
  conflicts=(stderred)

  cd "$_gitname"/build
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/$_gitname"/README.md "$pkgdir"/usr/share/doc/stderred/README.md
  install -D "$srcdir/$_gitname"/LICENSE "$pkgdir"/usr/share/licenses/stderred-git/LICENSE
  install -D "$srcdir/$_gitname"/usr/bin/stderred "$pkgdir"/usr/bin/stderred
  install -D "$srcdir/$_gitname"/usr/share/stderred/stderred.sh "$pkgdir"/usr/share/stderred/stderred.sh
}

package_lib32-stderred-git() {
  depends=(lib32-glibc)
  provides=(lib32-stderred)
  conflicts=(lib32-stderred)

  cd "$_gitname"/build32
  make DESTDIR="$pkgdir" install
  install -D "$srcdir/$_gitname"/README.md "$pkgdir"/usr/share/doc/stderred/README-stderred32.md
  install -D "$srcdir/$_gitname"/LICENSE "$pkgdir"/usr/share/licenses/lib32-stderred-git/LICENSE
  install -D "$srcdir/$_gitname"/usr/bin/stderred32 "$pkgdir"/usr/bin/stderred32
  install -D "$srcdir/$_gitname"/usr/share/stderred/stderred32.sh "$pkgdir"/usr/share/stderred/stderred32.sh
}
