# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=gnsstk-apps
pkgname="${_pkgname}-git"
pkgver=14.1.1.r7158.20231219.79a70c4f0
pkgrel=2
pkgdesc="Utilities using the GNSSTk core library, a library for GNSS (Global Navigation Satellite System) stuff."
arch=(
  "i686"
  "x86_64"
)
url="https://gitlab.com/sgl-ut/gnsstk-apps"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'libgnsstk.so'
)
makedepends=(
  'cmake'
  'git'
  'gnsstk'
  'make'
  # 'swig'  # Currently, fails to build the python binding; see https://gitlab.com/sgl-ut/gnsstk/-/issues/4. 'swig' is only needed to build python binding.
)
optdepends=(
  "bash: For '/usr/bin/gnsstk-config'."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "gpstk"
)
source=(
  "${_pkgname}::git+https://gitlab.com/sgl-ut/gnsstk-apps.git"
)
sha256sums=(
  'SKIP'                                                              # Main upstream source
)

prepare() {
  cd "${srcdir}"

  #local _patch
  #for _patch in "${srcdir}/01_-_add-include-cstdint.patch"; do
  #  printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
  #  patch -Np1 --follow-symlinks -i "${_patch}" -d "${_pkgname}"
  #done

  if [ -d build ]; then
    rm -R build
  fi

  mkdir -p build

  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}


build() {
  cd "${srcdir}"

  _CFLAGSADDITIONS="-Wno-deprecated-declarations"
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  _cmake_config_opts=(
    -DBUILD_EXT=ON
    -DBUILD_FOR_PACKAGE_SWITCH=OFF # `=ON` here also triggers python binding build error https://gitlab.com/sgl-ut/gnsstk/-/issues/4.
    -DBUILD_PYTHON=OFF # Currently, fails to build the python binding; see https://gitlab.com/sgl-ut/gnsstk/-/issues/4.
    -DCOVERAGE_SWITCH=OFF
    -DDEBUG_SWITCH=ON  # Controls cmake verbose variable printout
    -DDEBUG_VERBOSE=ON # Controls cmake verbose variable printout
    -DTEST_SWITCH=ON
    -DVERSIONED_HEADER_INSTALL=ON
  )

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_INSTALL_PREFIX=/usr \
    -DUSE_RPATH=OFF \
    "${_cmake_config_opts[@]}" \
    -Wno-dev

  make -C build
}

# 2025-03-29: Tests fail.
#check() {
#  cd "${srcdir}"
#
#  make -C build test
#}

package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 gpstk-logo-small.jpg "${pkgdir}/usr/share/pixmaps/gnsstk.jpg"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log AUTHORS.md changes.txt ChangeLog.md CODEOWNERS DOCUMENTATION.md gpstk-logo-small.jpg HOWTO.txt INSTALL.md INTRO.txt MAINPAGE.txt README.md RELNOTES.md TESTING.md

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING.LESSER.md LICENSE.md
}
