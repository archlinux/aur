# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_basename="kdelibs"
_commit_rel="d475620f8b4c03e84800f2c1a5ff575f6a78381f" # 1.1.2
_commit="eec7a2b34bf3aa14f775be132a9ff9c7767c5f62" # r116
pkgver="1.1.2+r116+g${_commit::7}"
_api="${pkgver%%.*}"
pkgname="${_basename}${_api}"
pkgrel=2
pkgdesc="KDE Core Libraries"
arch=('i686' 'x86_64')
url="https://kde.org"
_url="https://invent.kde.org/historical/kde${_api}-${_basename}"
license=('GPL-2.0-only AND LGPL-2.0-only')
depends=('gcc-libs' 'glibc' 'libjpeg' 'libpng' 'libtiff' 'libx11' 'libxext' "qt${_api}")
makedepends=('cmake>=3')
provides=('libjscript.so' 'libkab.so' 'libkdecore.so' 'libkdeui.so'
          'libkfile.so' 'libkfm.so' 'libkhtmlw.so' 'libkimgio.so'
          'libkspell.so' 'libmediatool.so')
groups=("kde${_api}")
_pkgsrc="${_url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgname}_po.patch")
b2sums=('14e1af4888723affce7e4351a6939f9a5e8fb64dcf4a164485689496709a6b948ea53582b650f5c8ad5f56418cf53362e984ca3acc60655ef767fd40c5046f9f'
        '80a5256ebf2897f091a7908fa158096eac9cc967c02a7e4736f1d88ad5fd66eb63ecfc75558dcd970259119c3e507578667c2e21395108e6ef0f3d344c56cd68')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_po.patch"
  # shellcheck disable=SC2016
  sed -e 's/cgi-bin/${CMAKE_INSTALL_BINDIR}/g' \
      -e '/add_subdirectory(kdetest)/d' \
      -i 'CMakeLists.txt'
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
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README"      "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "COPYING"     "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
  install -vDm644 "COPYING.LIB" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING.LIB"
}

# vim:set ts=2 sw=2 et:
