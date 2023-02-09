# Maintainer : bwrsandman
# Co-Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>

pkgname=openmw-git
pkgver=0.47.0.r4538.ga41cbfb349
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')
depends=('openal' 'openscenegraph' 'mygui' 'bullet-dp' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs' 'luajit' 'recastnavigation-openmw' 'yaml-cpp')
optdepends=('openscenegraph-openmw-git: experimental performance enhancements for OpenMW that are too controversial to be included in the general purpose OSG project')
makedepends=('git' 'cmake' 'boost' 'ninja')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/OpenMW/openmw.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  _tag="$(git describe --tags --match 'openmw-[01]*' --abbrev=0 $(git rev-list --tags) | uniq | sed 's/openmw-//' | sort | tail -n1)"
  _numcommits="$(git rev-list  openmw-$_tag..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DOPENMW_USE_SYSTEM_RECASTNAVIGATION=ON
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
