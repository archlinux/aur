# Maintainer: Sandy Carter <bwrsandman+aur@gmail.com>

pkgname=bgfx-cmake-git
pkgver=1.115.8109
pkgrel=1
pkgdesc="Cross-platform, graphics API agnostic, \"Bring Your Own Engine/Framework\" style rendering library. (With CMake build scripts)"
arch=('x86_64')
url="https://bkaradzic.github.io/bgfx"
license=('BSD' 'CC')

depends=('mesa' 'libx11')
makedepends=('git' 'cmake')
conflicts=(bgfx bgfx-git)
provides=(bgfx)

source=('git+https://github.com/bkaradzic/bx.git'
        'git+https://github.com/bkaradzic/bimg.git'
        'git+https://github.com/bkaradzic/bgfx.git'
        'git+https://github.com/bkaradzic/bgfx.cmake.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  # From bgfx.cpp source:
  # bgfx 1.104.7082
  #      ^ ^^^ ^^^^
  #      | |   +--- Commit number  (https://github.com/bkaradzic/bgfx / git rev-list --count HEAD)
  #      | +------- API version    (from https://github.com/bkaradzic/bgfx/blob/master/scripts/bgfx.idl#L4)
  #      +--------- Major revision (always 1)
  cd "${srcdir}/bgfx"
  api=`sed '4q;d' scripts/bgfx.idl  | sed 's,version(,,g' | sed 's,),,g'`
  printf "1.%s.%s" $api "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${srcdir}/bgfx.cmake"

  git config --file=.gitmodules submodule.bx.url $srcdir/bx
  git config --file=.gitmodules submodule.bimg.url $srcdir/bimg
  git config --file=.gitmodules submodule.bgfx.url $srcdir/bgfx
  git submodule sync
  git submodule update --init

  # prepend bgfx to bin names to avoid naming conflicts
  for BIN in geometryc geometryv shaderc texturec texturev
  do
    echo "" >> cmake/tools/$BIN.cmake
    echo "set_target_properties( $BIN PROPERTIES OUTPUT_NAME bgfx-$BIN )" >> cmake/tools/$BIN.cmake
  done
}

build() {
  cd "${srcdir}/bgfx.cmake"
  cmake -DBGFX_BUILD_EXAMPLES=OFF \
        -DBGFX_INSTALL_EXAMPLES=OFF \
        -DBGFX_CUSTOM_TARGETS=OFF \
        -DBGFX_LIBRARY_TYPE=SHARED \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build .
}

package() {
  cd "${srcdir}/bgfx.cmake"
  cmake --install . -v --strip --prefix "$pkgdir/usr"

  # remove helper and 3rdparty includes used to compile bgfx
  rm -rf ${pkgdir}/usr/include/compat
  rm -rf ${pkgdir}/usr/include/tinystl
}

# vim:set ts=2 sw=2 et:
