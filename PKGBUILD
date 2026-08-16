# Maintainer: Niccolo Belli <niccolo.belli@linuxsystems.it>

pkgname=openmw-freefps-rubic0n-native-git
pkgver=0.51.0.r6.g5e309685.rubic0n.r3542.gf3ee18af
pkgrel=2
pkgdesc='OpenMW 0.51 FreeFPS build with private Rubic0n, background Lua GC, LTO, and native CPU tuning'
arch=('x86_64')
url='https://gitgud.io/loregamer/openmw-fps'
license=('GPL-3.0-or-later' 'Apache-2.0' 'MIT' 'OFL-1.1' 'LicenseRef-DejaVuLGCSansMono')
depends=(
  'boost-libs'
  'bullet-dp'
  'ffmpeg'
  'glibc'
  'icu'
  'libgcc'
  'libstdc++'
  'libxt'
  'lz4'
  'mygui-openmw'
  'openal'
  'openscenegraph-openmw-git'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-tools'
  'recastnavigation-openmw'
  'sdl2'
  'sqlite'
  'unshield'
  'yaml-cpp'
  'zlib'
)
makedepends=('boost' 'cmake' 'doxygen' 'git' 'ninja')
provides=('openmw=0.51.0')
conflicts=('openmw' 'openmw-git' 'openmw-stable-git')
install="${pkgname}.install"
options=('!debug' 'lto' 'strip')

# FreeFPS master and Rubic0n development are deliberately tracked.
# This is the OpenMW commit from which the FreeFPS fork's own first-parent
# history starts; it is only a pkgver() anchor, not a source pin.
_freefps_base='673981c7f552089f1370d97fdac95e7221d4debc'
source=(
  'openmw-fps::git+https://gitgud.io/loregamer/openmw-fps.git#branch=master'
  'rubic0n::git+https://github.com/DreamWeave-MP/rubic0n.git#branch=development'
  'backport-background-lua-gc.patch'
  'private-rubic0n-static.patch'
  'maskedoc-native-baseline.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '15a38f070c6401d34278d898fe6b344c899afe3500fdf7c024192f3e180bd638'
  'ed442d7dcaec98d88fe5a2b7597b4fb1806b35fde6eab6dac67060212432aa91'
  '2299bf55ddeb4704834148c8cda6a7710816a10cceae471ff2d4323eba6f15b4'
)

pkgver() {
  local openmw_revision openmw_hash rubic0n_revision rubic0n_hash

  git -C "${srcdir}/openmw-fps" merge-base --is-ancestor \
    "${_freefps_base}" HEAD || return 1
  openmw_revision="$(git -C "${srcdir}/openmw-fps" rev-list \
    --first-parent --count "${_freefps_base}..HEAD")"
  openmw_hash="$(git -C "${srcdir}/openmw-fps" rev-parse --short=8 HEAD)"
  rubic0n_revision="$(git -C "${srcdir}/rubic0n" rev-list --count HEAD)"
  rubic0n_hash="$(git -C "${srcdir}/rubic0n" rev-parse --short=8 HEAD)"

  printf '0.51.0.r%s.g%s.rubic0n.r%s.g%s' \
    "${openmw_revision}" "${openmw_hash}" "${rubic0n_revision}" "${rubic0n_hash}"
}

prepare() {
  cd "${srcdir}/openmw-fps"

  # Exact backports of OpenMW ec26c521 and its required race fix d7c2f416.
  patch -Np1 -i "${srcdir}/backport-background-lua-gc.patch"

  # Add an explicit static-Rubic0n integration path to OpenMW's CMake build.
  patch -Np1 -i "${srcdir}/private-rubic0n-static.patch"

  # Keep MOC's baseline dispatch unit free of AVX/VEX instructions and disable
  # strict-aliasing assumptions for its non-conforming SIMD lane accessors.
  patch -Np1 -i "${srcdir}/maskedoc-native-baseline.patch"

  # Rubic0n enables Lua 5.2 compatibility. Its resource fixes OpenMW 0.51's
  # __ipairs implementation for those semantics.
  install -Dm644 \
    "${srcdir}/rubic0n/resources/lua_libs/content.lua" \
    components/lua_ui/content.lua
}

build() {
  # This package is intentionally tied to the CPU on which makepkg is run.
  local file_prefix_map="-ffile-prefix-map=${srcdir}=/usr/src/${pkgname}"
  export CFLAGS="${CFLAGS} -march=native ${file_prefix_map}"
  export CXXFLAGS="${CXXFLAGS} -march=native ${file_prefix_map}"

  make -C "${srcdir}/rubic0n" clean
  make -C "${srcdir}/rubic0n" BUILDMODE=static

  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake \
    -S "${srcdir}/openmw-fps" \
    -B "${srcdir}/build" \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D OPENMW_LTO_BUILD=ON \
    -D OPENMW_RUBIC0N_ROOT="${srcdir}/rubic0n" \
    -D OPENMW_USE_SYSTEM_BULLET=ON \
    -D OPENMW_USE_SYSTEM_MYGUI=ON \
    -D OPENMW_USE_SYSTEM_OSG=ON \
    -D OPENMW_USE_SYSTEM_RECASTNAVIGATION=ON

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  install -Dm644 "${srcdir}/openmw-fps/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.openmw"
  install -Dm644 "${srcdir}/openmw-fps/extern/maskedoc/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.maskedoc"
  install -Dm644 "${srcdir}/rubic0n/COPYRIGHT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rubic0n"
}

# vim: ts=2 sw=2 et:
