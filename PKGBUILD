# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="kdetoys"
_commit_rel="f8ed832e63a5c4558e415750fc412d633001f574" # 1.1.2
_commit="66a0fb39185d9733d294156881ba631de53e432d" # r11
pkgver="1.1.2+r11+g${_commit::7}"
_api="${pkgver%%.*}"
pkgname="${_basename}${_api}"
pkgrel=2
pkgdesc="KDE Toys and Amusements"
arch=('i686' 'x86_64')
url="https://kde.org"
_url="https://invent.kde.org/historical/kde${_api}-${_basename}"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' "kdelibs${_api}" 'libx11' "qt${_api}")
makedepends=('cmake>=3')
groups=("kde${_api}"{,-applications,-utilities})
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_po.patch"
        "${pkgname}_versioned.patch")
b2sums=('ab345f953032567eb9538ad886560cc1763f821ad1a64038af6f5e8d9f88e8349cd9524a0175005320ae14d820d5adf593094e0aedc8fcda68f21fae377a442a'
        'af3d17f657cea3775d29f6a14e1e832db67b160129c30962105aded4ce2161527d46a63cf931a571308334c5733eb7317520a3c3d7888e66c12f4ecc9b0dc19d'
        'e3b38ee0ce16c153c94a98e37067bc80e6f727b26382d1d184cb2ffb0a9d36f48909e7256c84361553b7ad0f5a526e9dfe62dfaeac2705b7f66b7edda1b240a4')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_po.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_versioned.patch"

  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -i 'CMakeLists.txt'
}

build() {
  export CFLAGS+=" -Wno-old-style-definition"
  export CXXFLAGS+=" -fpermissive -std=c++98 -Wno-write-strings"
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
