# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="qt"
_commit_rel="737c792a14570be12ec24514552fde949cc4dd5a" # 2.3.2
_commit="6f380baa9866bce8ccc34e166dfeca3ff3cd978e" # r63
pkgver=2.3.2+kde+r63
pkgbase="${_basename}${pkgver%%.*}"
pkgname=("${pkgbase}"{,-docs})
pkgrel=1
pkgdesc="A cross-platform application and UI framework"
arch=('i686' 'x86_64')
url="https://www.qt.io"
_url="https://invent.kde.org/sandsmark/${pkgbase}"
license=('QPL-1.0 OR GPL-2.0-only')
makedepends=('byacc' 'cmake>=3.2' 'fontconfig' 'glu' 'glut' 'libgl' 'libice'
             'libjpeg' 'libmng' 'libpng' 'libsm' 'libx11' 'libxext' 'libxft'
             'libxmu')
_pkgsrc="${pkgbase}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${pkgbase}_manpages.patch")
b2sums=('1d68e61f41a2b059e5319374875503421ba5ed0165f046808b38827bbae466527146b431c0900a7a14e2deccaebf08dbd0b78ff37de711b6ad9435a0661119c2'
        'abb02f33ce23787b758d4d8e23eba8f4d240c15dec99e502977786102c17272c608bf8d0e5b94fbe07ce733b8ab226ac065d440d34ec3941cc6411b2cba2e702')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgbase}_manpages.patch"
  sed -i '/set(CMAKE_VERBOSE_MAKEFILE ON)/d' 'CMakeLists.txt'
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

package_qt2() {
  depends=('fontconfig' 'gcc-libs' 'glibc' 'libgl' 'libice' 'libjpeg' 'libmng'
           'libpng' 'libsm' 'libx11' 'libxext' 'libxft' 'libxmu' 'zlib')
  provides=("lib${pkgbase}.so")

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.QT"   "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 ./LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  cd "${pkgdir}/usr/share"
  rm -rf "doc/${pkgbase}/html" "man"
}

package_qt2-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/doc"

  cd "${pkgdir}/usr/share/man"
  # for f in man1/*.1;   do mv -- "$f" "${f%.1}-qt2.1"; done
  for f in man3/*.3qt; do mv -- "$f" "man3/qt2-$(basename "${f%.3qt}").3"; done
}
