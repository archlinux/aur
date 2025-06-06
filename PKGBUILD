# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kcmlaptop"
_commit_rel="a78e63ba691fc0aa5c3ce1ddf89cdaf028c54011" # 0.82
_commit="8f31d4dee991d166612d7b6f05c6b0909e340541" # r25
pkgver="0.82+r25+g${_commit::7}"
_api=1
pkgrel=1
pkgdesc="Laptop control panel for KDE - including battery monitor and suspend control"
arch=('i686' 'x86_64')
url="https://invent.kde.org/sandsmark/kde${_api}-${pkgname}"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' "kdelibs${_api}" 'libxss' "qt${_api}" 'systemd-libs')
makedepends=('cmake>=3')
groups=("kde${_api}"{,-applications,-settings})
_pkgsrc="${url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${_commit}/${_pkgsrc}.tar.gz")
b2sums=('3fc56a43dab7c1b2f11cd1475f636a8048ce3d1e06d7ff9511217b2f9a3446dab02e199f65a6bf238a5366512367528ade33961988401ce6439357120d067180')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  export CXXFLAGS+=" -Wno-format-security -Wno-write-strings"
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
