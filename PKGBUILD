# Maintainer : bwrsandman
# Co-Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# thanks to txtsd <aur.archlinux@ihavea.quest> for contributing some parts of the PKGBUILD code

pkgname=openmw-git
pkgver=0.48.0.rc9.r1887.g9f653b2a79
pkgrel=2
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64' 'aarch64')
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
  _pattern='^([0-9]{2})-rc([0-9]{1,2}$)'
  _tag="$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/openmw-//')"
  if [[ $_tag =~ $_pattern ]] ;
  then
    _tag=$(echo $_tag | sed -E 's/^([0-9]{2})-rc([0-9]{1,2}$)/0.\1.0.rc\2/')
  fi
  _numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=RelWithDebInfo \
        -D OPENMW_USE_SYSTEM_RECASTNAVIGATION=ON \
        -D LICDIR=/usr/share/licenses/${pkgname}
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
