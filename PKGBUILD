# Maintainer : bwrsandman
# Co-Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# thanks to txtsd <aur.archlinux@ihavea.quest> for contributing some parts of the PKGBUILD code

pkgname=openmw-git
pkgver=0.48.0.r4764.g012d10703f
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64' 'aarch64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')
depends=('openal' 'openscenegraph-openmw-git' 'mygui-openmw' 'bullet-dp' 'qt6-base' 'qt6-tools' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs' 'luajit' 'recastnavigation-openmw' 'yaml-cpp' 'sqlite')
optdepends=('openscenegraph-openmw-git: experimental performance enhancements for OpenMW that are too controversial to be included in the general purpose OSG project')
makedepends=('git' 'cmake' 'boost' 'debugedit')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://gitlab.com/OpenMW/openmw.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  _tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
  # We want the latest/highest minor version for _tag
  # First we strip off any openmw-*
  # There must be no dashes.
  # We remove any other words such as rc
  # Finally, if there is no major or patch number, add 0
  # Test using this script:
  # $ declare -a test_tags=("openmw-0.29.0" "0.42.0" "0.42.1" "1.42.1" "0.47.0-RC3" "openmw-48-rc10")
  # for _tag in "${test_tags[@]}"; do
  #     _fixed_tag=$(echo $_tag | sed 's/^openmw-//' | sed 's/-.*//' | sed -E 's/^([0-9]+)$/0.\1.0/')
  #     echo "$_tag -> $_fixed_tag"
  # done
  # Expected output:
  # openmw-0.29.0 -> 0.29.0
  # 0.42.0 -> 0.42.0
  # 0.42.1 -> 0.42.1
  # 1.42.1 -> 1.42.1
  # 0.47.0-RC3 -> 0.47.0
  # openmw-48-rc10 -> 0.48.0
  _fixed_tag=$(echo $_tag | sed 's/^openmw-//' | sed 's/-.*//' | sed -E 's/^([0-9]+)$/0.\1.0/')
  _numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
  _hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.g%s" "$_fixed_tag" "$_numcommits" "$_hash"
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
