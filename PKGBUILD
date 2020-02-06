pkgname=openblack-git
pkgver=r891.b6669b7
pkgrel=1
pkgdesc="Open source reimplementation of the game Black & White (2001)."
arch=('x86_64')
url="https://github.com/openblack/openblack"
license=('GPL3' 'MIT')

depends=('fmt' 'spdlog' 'entt' 'glew' 'sdl2' 'glm')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('git://github.com/openblack/openblack.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  # TODO: After bgfx merges all openblack PRs,
  # Package and use bgfx instead of building it
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SUBMODULES=OFF \
        -DOPENBLACK_BUILD_BGFX=ON \
        -DCMAKEuBUILD_TYPE=RelWithDebInfo
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
