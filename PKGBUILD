# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=ftgl
pkgname=mingw-w64-$_pkgname
pkgver=2.4.0
pkgrel=1
pkgdesc='OpenGL library to use arbitrary fonts (mingw-w64)'
arch=('any')
url='https://github.com/frankheckenbach/ftgl'
license=('MIT')
depends=(mingw-w64-crt mingw-w64-freetype2)
makedepends=(mingw-w64-gcc mingw-w64-cmake git ninja)
options=(!strip !buildflags !libtool staticlibs)
_commit=483639219095ad080538e07ceb5996de901d4e74  # tags/v2.4.0
source=("git+https://github.com/frankheckenbach/ftgl#commit=$_commit")
sha256sums=('SKIP')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd $_pkgname
  git cherry-pick -n 835f2ba7911a6c15a1a314d5e3267fa089b5a319
}

build() {
  for _arch in ${_architectures}; do
    export PKG_CONFIG=/usr/bin/$_arch-pkg-config
    $_arch-cmake -G Ninja -B build-$_arch -S $_pkgname
    VERBOSE=1 cmake --build build-$_arch
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-$_arch
    install -Dm644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname

    find "$pkgdir/usr/$_arch" -iname '*.exe' -exec $_arch-strip --strip-all {} \;
    find "$pkgdir/usr/$_arch" -iname '*.dll' -exec $_arch-strip --strip-unneeded {} \;
    find "$pkgdir/usr/$_arch" -iname '*.a'   -exec $_arch-strip -g {} \;
  done
}
