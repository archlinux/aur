# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kmorph"
_commit_rel="82d0ef8c0ddb9e83c1b436e32616e018d38f60dd" # 0.1.5
_commit="747d0fb4fc4716b11f9288a80a125b289c41b80d" # r3
pkgver="0.1.5+r3+g${_commit::7}"
_api=1
pkgrel=1
pkgdesc="A simple morph-utility for the KDE"
arch=('i686' 'x86_64')
url="https://invent.kde.org/sandsmark/kde${_api}-${pkgname}"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' "kdelibs${_api}" "qt${_api}")
makedepends=('cmake>=3')
groups=("kde${_api}"{,-applications,-utilities})
_pkgsrc="${url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${_commit}/${_pkgsrc}.tar.gz")
b2sums=('2ad6ff8e8b94b2ec9abd1743fbd16f215fd6612f01644baa9d20e4d70708268f8d426b6fceaf5e4808f09a0c1c802e456bd912eb79c3ea8f2d9b6f6fdd5903cf')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  export CXXFLAGS+=" -fpermissive -Wno-write-strings"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

# vim:set ts=2 sw=2 et:
