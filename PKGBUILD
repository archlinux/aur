# Maintainer : bwrsandman
# Co-Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# thanks to txtsd <aur.archlinux@ihavea.quest> for contributing some parts of the PKGBUILD code

pkgname=openmw-git
pkgver=0.48.0.r2539.g98bb9fc125
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64' 'aarch64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')
depends=('openal' 'openscenegraph' 'mygui' 'bullet-dp' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs' 'luajit' 'recastnavigation-openmw' 'yaml-cpp' 'sqlite')
optdepends=('openscenegraph-openmw-git: experimental performance enhancements for OpenMW that are too controversial to be included in the general purpose OSG project')
makedepends=('git' 'cmake' 'boost')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/OpenMW/openmw.git')
sha1sums=('SKIP')

pkgver() {
  # We want the latest/highest minor version for _tag
  # First we strip off any openmw-*
  # There must be no dashes.
  # Finally we remove any other words such as rc
  # openmw-0.29.0  -> _tag=0.29.0
  # 0.42.0         -> _tag=0.42.0
  # 0.47.0-RC3     -> _tag=0.47.0
  # openmw-48-rc10 -> _tag=0.48.0
  # stable         -> invalid, find the next one
  cd "${srcdir}/${pkgname%-git}"
  _tag="$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/openmw-//' | sed 's/-.*//')"
  _numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "0.%s.0.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

build() {

  cmake \
        -B _build \
        -S "${srcdir}/${pkgname%-git}"  \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=RelWithDebInfo \
        -D OPENMW_USE_SYSTEM_RECASTNAVIGATION=ON \
        -D LICDIR=/usr/share/licenses/${pkgname}
  make -C _build
}

package() {
  make DESTDIR="$pkgdir" -C _build install
  install -Dm 644 "${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
