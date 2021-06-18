# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Contributor: Sandy Carter <bwrsandman@gmail.com>

pkgname=openmw-vr-git
pkgver=r25608.ca2356615
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind, fork with OpenXR VR support."
arch=('i686' 'x86_64')
url="https://gitlab.com/madsbuvi/openmw"
license=('GPL3' 'MIT' 'custom')
depends=('openal' 'openscenegraph' 'mygui' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs' "openxr")
optdepends=('openscenegraph-openmw-git: experimental performance enhancements for OpenMW that are too controversial to be included in the general purpose OSG project')
makedepends=('git' 'cmake' 'boost' 'clang' 'ninja')
conflicts=("${pkgname%-git}" 'openmw-git')
provides=("${pkgname%-git}" 'openmw-git')
source=('git+https://gitlab.com/madsbuvi/openmw.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/openmw"
  #_tag="$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/openmw-//')"
  #_numcommits="$(git rev-list  `git rev-list --tags --no-walk --max-count=1`..HEAD --count)"
  #_hash="$(git rev-parse --short HEAD)"
  #printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/openmw"

  # https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/260
  export CC=clang CXX=clang++

  # -DOPENMW_USE_SYSTEM_BULLET=OFF: Doesn't build with bullet from repo

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DDESIRED_QT_VERSION=5 \
        -DOPENMW_USE_SYSTEM_BULLET=OFF \
        -GNinja \
        -Bbuild
  ninja -C build
}

package() {
  cd "${srcdir}/openmw"
  DESTDIR="$pkgdir" ninja -C build install

  # actual binary is not installed by default
  install -m755 "$srcdir"/openmw/build/openmw_vr "$pkgdir"/usr/bin/openmw_vr
  install "$srcdir"/openmw/build/settings-overrides-vr.cfg "$pkgdir"/etc/openmw/settings-overrides-vr.cfg

  # install target shouldn't install openxr loader
  rm -rf "$pkgdir"/usr/include/openxr
  rm -rf "$pkgdir"/usr/lib/cmake/openxr
  rm -rf "$pkgdir"/usr/lib/libopenxr*
  rm -rf "$pkgdir"/usr/lib/pkgconfig/openxr.pc
  rm -rf "$pkgdir"/usr/share/doc/openxr
}

# vim:set ts=2 sw=2 et:
