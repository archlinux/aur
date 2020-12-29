pkgname=openblack-git
pkgver=r1012.b2a2147
pkgrel=1
pkgdesc="Open source reimplementation of the game Black & White (2001)."
arch=('x86_64')
url="https://github.com/openblack/openblack"
license=('GPL3' 'MIT')

depends=('fmt' 'spdlog' 'entt' 'sdl2' 'glm')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

# TODO: After bgfx merges all openblack PRs,
# Package and use bgfx instead of building it
source=('git://github.com/openblack/openblack.git'
        'git://github.com/openblack/bgfx.cmake.git'
        'git://github.com/bkaradzic/bx.git'
        'git://github.com/bkaradzic/bimg.git'
        'git://github.com/openblack/bgfx.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/bgfx.cmake"
  git config --file=.gitmodules submodule.bx.url "${srcdir}"/bx
  git config --file=.gitmodules submodule.bimg.url "${srcdir}"/bimg
  git config --file=.gitmodules submodule.bgfx.url "${srcdir}"/bgfx
  git submodule sync
  git submodule update --init
}

build() {
  msg Building bgfx
  cd "${srcdir}/bgfx.cmake"
  cmake -DBGFX_BUILD_EXAMPLES=OFF \
        -DCMAKE_INSTALL_PREFIX=install \
        -DBGFX_CUSTOM_TARGETS=OFF \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build .
  cmake --install .

  msg Building openblack
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dbgfx_DIR="${srcdir}/bgfx.cmake/install/lib/cmake/bgfx" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
