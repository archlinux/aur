# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="kteatime"
_commit_rel="21ff58252523d1f978de95fd4de4b94179ad514f" # 1.0
_commit="f4672332cb1a80c81cb7177af8a13781d5aad938" # r2
pkgver="1.0+r2+g${_commit::7}"
_api="${pkgver%%.*}"
pkgname="${_basename}${_api}"
pkgrel=1
pkgdesc="A handy timer for steeping tea"
arch=('i686' 'x86_64')
url="https://apps.kde.org/${_basename}/"
_url="https://invent.kde.org/sandsmark/kde${_api}-${_basename}"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' "kdelibs${_api}" "qt${_api}")
makedepends=('cmake>=3')
groups=("kde${_api}"{,-applications,-utilities})
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_versioned.patch")
b2sums=('145134a9a14c96a20072f65e3b9656e280f82849b76e83947ae50f72f05fe0979c8901e336747db8c312a123bb0a07ed16a10ac0d1abef13c2d05deb627a4aff'
        '71020f1c2fbf0812f6606cdb7666ea7732a17ed2082beb58af95785b0f663587fbd9e2b080192f76b9a582c4ac0bc89f5202c3794ccb923f825aa9c0faa16c6f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_versioned.patch"

  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  export CXXFLAGS+=" -Wno-write-strings"
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

  # cd "${_pkgsrc}"
  # install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

# vim:set ts=2 sw=2 et:
