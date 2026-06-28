# Maintainer : Niccolò Belli <niccolo.belli@linuxsystems.it>
# Thanks to Lone_Wolf <lone_wolf@klaas-de-kat.nl> and txtsd <aur.archlinux@ihavea.quest> for contributing some parts of the PKGBUILD code
# Thanks to bwrsandman for the original PKGBUILD

pkgname=openmw-stable-git
pkgver=0.51.0.r1.g7a27f1559d
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64' 'aarch64')
url="http://www.openmw.org"
license=('GPL-3.0-or-later' 'MIT' 'custom')
depends=('openal' 'openscenegraph-openmw-git' 'mygui-openmw' 'bullet-dp' 'qt6-base' 'qt6-svg' 'qt6-tools' 'qt6-declarative' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs' 'luajit' 'recastnavigation-openmw' 'yaml-cpp' 'sqlite')
makedepends=('git' 'cmake' 'boost' 'debugedit')
conflicts=('openmw' 'openmw-git')
provides=('openmw')
source=('git+https://gitlab.com/OpenMW/openmw.git#branch=openmw-51'
)
sha1sums=('SKIP')
options=(debug strip)

pkgver() {
  cd "${srcdir}/openmw"
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
        -S "${srcdir}/openmw"  \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=RelWithDebInfo \
        -D OPENMW_USE_SYSTEM_RECASTNAVIGATION=ON \
        -D OPENMW_USE_SYSTEM_MYGUI=ON \
        -D OPENMW_LTO_BUILD=ON \
        -D LICDIR=/usr/share/licenses/${pkgname}
  make -C _build
}

package() {
  make DESTDIR="$pkgdir" -C _build install
  install -Dm 644 "openmw/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
