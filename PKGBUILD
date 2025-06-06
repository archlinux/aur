# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kplot3d"
_commit_rel="c28aaaadf8e5bf3d561c4c93d6b61c2ece9f6efb" # 0.70
_commit="95b2b78f19ae55d53ba3f40962dd77ae99c9c088" # r1
pkgver="0.70+r1+g${_commit::7}"
_api=1
pkgrel=1
pkgdesc="Tool for building 3D surface of function z = f(x,y)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/sandsmark/kde${_api}-${pkgname}"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' "kdelibs${_api}" "qt${_api}")
makedepends=('cmake>=3')
groups=("kde${_api}"{,-applications,-utilities})
_pkgsrc="${url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${_commit}/${_pkgsrc}.tar.gz")
b2sums=('b097f9dadbf8391c7e91e40f0589ff6f597466c3a2591b940a93622882e1f4fa7b910f509a93caedfcd46dbe632d3465f21fcf34f1f79ab8cc85b4108e6e4928')

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
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

# vim:set ts=2 sw=2 et:
