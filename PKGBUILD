# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="qt"
pkgver=2.3.2
pkgbase="${_basename}${pkgver%%.*}"
pkgname=("${pkgbase}"{,-docs})
pkgrel=1
pkgdesc="A cross-platform application and UI framework"
arch=('i686' 'x86_64')
url="https://www.qt.io"
license=('QPL-1.0 OR GPL-2.0-only')
makedepends=('byacc' 'cmake>=3.2' 'fontconfig' 'glu' 'glut' 'libgl' 'libice'
             'libjpeg' 'libmng' 'libpng' 'libsm' 'libx11' 'libxext' 'libxft'
             'libxmu')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://download.qt.io/archive/${_basename}/${pkgver%%.*}/${_basename}-x11-${pkgver}.tar.gz"
        "${pkgbase}_heliocastro.p1.patch::https://github.com/heliocastro/qt2/commit/080df684e1a5d9a76f1355b542e6b49a2c9cec3c.patch?full_index=1"
        "${pkgbase}_heliocastro.p2.patch::https://github.com/heliocastro/qt2/compare/Original_Qt2...c47756733f1ad6f30065a3ff8d2c1ef02602b789.patch?full_index=1"
        "${pkgbase}_sandsmark.patch::https://github.com/sandsmark/qt2/compare/3a0c5d71d20ea5b3d001a6d4c2cf2e1f1646f14b...367a986220ea1c4d01268f0c0e74cd1e7c888298.patch?full_index=1")
sha256sums=('0d7511c3a055f6ed89e6606bafa52510b9da33e96db1d2086642c49aea46b9fa'
            'dbb22b2ab128a48bf0ba55902c61fae3fa7f04c6ff3ba6222d6e6b513ada8945'
            '627740f0294596df6063f857700c7462c9f14c551c05784839031ba5e3ff9fe5'
            '36633cb6092f0524ee83aac5f6651dd7c0bff7b166352e0270d57042d4d09817')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type d -exec chmod 755 {} +
  find . -type f -exec chmod 644 {} +

  patch -Np1 -i "${srcdir}/${pkgbase}_heliocastro.p1.patch" || true
  patch -Np1 -i "${srcdir}/${pkgbase}_heliocastro.p2.patch" || true
  patch -Np1 -i "${srcdir}/${pkgbase}_sandsmark.patch" || true

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

  cd "${pkgdir}/usr/share/doc/${pkgbase}"
  rm -rf "html"
}

package_qt2-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/doc"

  # cd "${_pkgsrc}/doc"
  # find "man" -type f -name '*.[1-9]qt' -exec \
  #   sh -c 'install -vDm644 "$1" "$2/usr/share/qt2-${1%qt}"' _ {} "${pkgdir}" \;
}
