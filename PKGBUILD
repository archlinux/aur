# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>

_basename="libdbusmenu-qt"
pkgname="${_basename}4"
pkgver=0.9.3+16.04.20160218
pkgrel=3
pkgdesc="A library that provides a Qt implementation of the DBusMenu spec"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/desktop-app/${_basename}"
license=('LGPL-2.1-or-later')
depends=('gcc-libs' 'glibc' 'qt4')
makedepends=('cmake>=2.8.11') # 'qjson>=0.5'
provides=("${_basename}" "${_basename}.so") # "${pkgname}.so"
conflicts=("${_basename}")
replaces=("${_basename}")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://archive.ubuntu.com/ubuntu/pool/main/${_basename::4}/${_basename}/${_basename}_${pkgver}.orig.tar.gz")
sha256sums=('a8e6358a31c44ccdf1bfc46c95a77a6bfc7fc1f536aadb913ed4f4405c570cf6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # is this needed?
  # -e 's/set(QT_SUFFIX "qt")/set(QT_SUFFIX "qt4")/g' \
  sed -e '/add_subdirectory(tests)/d' \
      -e '/add_subdirectory(tools)/d' \
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
    -D WITH_DOC:BOOL=OFF
    -D USE_QT4:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "NEWS"    "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}
