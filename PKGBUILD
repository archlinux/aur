# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=gpstk
pkgname="${_pkgname}-git"
pkgver=8.0.0+16.r6655.20220528.a39846939
pkgrel=1
pkgdesc="Core library and applications for use with GNSS/ satellite navigation (deprecated; upstream project is archived, successor: 'gnsstk' and 'gnsstk-apps'.)"
arch=(
  "i686"
  "x86_64"
)
url="https://gitlab.com/sgl-ut/gpstk"
license=('LGPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cmake'
  'git'
  'make'
  # 'python-wheel'
  # 'swig'         # Needed to build python binding, but building python binding fails with `No rule to make target '/lib.so', needed by 'swig/_gpstk.so'`.
)
optdepends=(
  "bash: For '/usr/bin/gpstk-config'."
)
provides=(
  "${_pkgname}=${pkgver}"
  "df_diff"
  "libgpstk.so"
)
conflicts=(
  "${_pkgname}"
  "df_diff"
  "gnsstk-apps"
  "libgpstk.so"
)
source=(
  "${_pkgname}::git+https://gitlab.com/sgl-ut/gpstk.git"
  # "01_-_add-include-cstdint.patch"  # Works arround https://gitlab.com/sgl-ut/gnsstk/-/issues/3.
)
sha256sums=(
  'SKIP'                                                              # Main upstream source
  # '51b758815ec736ea5608c117d1721780bba7988edde1f6cf0f02dd6141b1f10c'  # 01_-_add-include-cstdint.patch
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
    -DBUILD_FOR_PACKAGE_SWITCH=OFF # For building python, but that fails with `No rule to make target '/lib.so', needed by 'swig/_gpstk.so'`.
    -DBUILD_PYTHON=OFF # Building python binding fails with `No rule to make target '/lib.so', needed by 'swig/_gpstk.so'`.
    -DCOVERAGE_SWITCH=OFF
    -DDEBUG_SWITCH=ON  # Controls cmake verbose variable printout
    -DDEBUG_VERBOSE=ON # Controls cmake verbose variable printout
    #-DPIP_WHEEL_SWITCH=OFF # Building python binding fails with `No rule to make target '/lib.so', needed by 'swig/_gpstk.so'`.
    #-DPYTHON_USER_INSTALL=OFF # Building python binding fails with `No rule to make target '/lib.so', needed by 'swig/_gpstk.so'`.
    -DTEST_SWITCH=ON
    -DUSE_RPATH=OFF
    -DVERSIONED_HEADER_INSTALL=ON
  )

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_INSTALL_PREFIX=/usr \
    "${_cmake_config_opts[@]}" \
    -Wno-dev

  make -C build
}

# 2025-03-29: Cannot build tests, otherwise build fails with `No rule to make target '/lib.so', needed by 'swig/_gpstk.so'`.
#check() {
#  cd "${srcdir}"
#
#  make -C build test
#}

package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 gpstk-logo-small.jpg "${pkgdir}/usr/share/pixmaps/gpstk.jpg"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log AUTHORS.md ChangeLog.md CODEOWNERS DOCUMENTATION.md gpstk-logo-small.jpg INSTALL.md PYTHON.md README.md RELNOTES.md TESTING.md

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING.LESSER.md LICENSE.md
}
