pkgname=openmw-git
pkgver=0.47.0.r2799.g28c97c22b9
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')
# Workaround ffmpeg4.4 https://gitlab.com/OpenMW/openmw/-/issues/6631#note_848732223
depends=('openal' 'openscenegraph' 'mygui' 'bullet-multithreaded' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs' 'luajit' 'recastnavigation-openmw' 'yaml-cpp')
optdepends=('openscenegraph-openmw-git: experimental performance enhancements for OpenMW that are too controversial to be included in the general purpose OSG project')
makedepends=('git' 'cmake' 'boost')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/OpenMW/openmw.git')
sha1sums=('SKIP')
# build breaks with clean chroot build using devtools without disabling lto explicitly, see https://bbs.archlinux.org/viewtopic.php?id=277304
options=(!lto)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  _tag="$(git describe --tags --match 'openmw*' --abbrev=0 $(git rev-list --tags) | head -n 1 | sed 's/openmw-//')"
  _numcommits="$(git rev-list  `git rev-list --tags --no-walk --max-count=1`..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DDESIRED_QT_VERSION=5 \
        -DOPENMW_USE_SYSTEM_RECASTNAVIGATION=ON
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
