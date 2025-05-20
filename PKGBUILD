# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="qjson"
pkgname="${_basename}-qt5"
_commit_rel="eee8a1626f18499a95a5216dd1832f45c15a46ba" # 0.9.0
_commit="d2731237ba0a4176be2483fed79bbd8c451671e4" # r32
pkgver="0.9.0+r32+g${_commit::7}"
pkgrel=1
pkgdesc="A Qt-based library that maps JSON data to QVariant objects"
arch=('i686' 'x86_64')
url="https://qjson.sourceforge.net"
_url="https://github.com/flavio/${_basename}"
license=('LGPL-2.1-only' 'GPL-2.0-with-bison-exception')
depends=('gcc-libs' 'glibc' 'qt5-base')
makedepends=('cmake>=2.8.8')
provides=("lib${pkgname}.so")
_pkgsrc="${_basename}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
b2sums=('abf90a40508955f38293679b9b5ee3a083533489833f96e4ff64b3359f153be19eff329f8d564be20bf5294fc9d7fb02b510265b8be32209f85f391deab65bb9')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i '/SET CMP0020 OLD/d' 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D QJSON_BUILD_TESTS:BOOL=ON
    -D QT4_BUILD:BOOL=OFF
    -D QT_VERSION=5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "README.license" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  install -vDm644 "COPYING.lib" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

# vim:set ts=2 sw=2 et:
