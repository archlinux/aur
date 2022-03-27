# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname='qbittorrent-enhanced-qt5-git'
pkgver=4.4.2.10.r3.g780ad2c06
pkgrel=1
pkgdesc='Bittorrent client using Qt5 and libtorrent-rasterbar, Enhanced Edition mod'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/c0re100/qBittorrent-Enhanced-Edition'
license=('custom:GPL_with_OpenSSL_exception')
depends=('dbus'
         'gcc-libs'
         'glibc'
         'hicolor-icon-theme'
         'libtorrent-rasterbar'
         'openssl'
         'qt5-base'
         'zlib')
makedepends=('boost'
             'cmake'
             'ninja'
             'qt5-svg'
             'qt5-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent'
          'qbittorrent-enhanced'
          'qbittorrent-enhanced-qt5'
          'qbittorrent-qt5')
conflicts=('qbittorrent'
           'qbittorrent-dark-git'
           'qbittorrent-enhanced'
           'qbittorrent-enhanced-git'
           'qbittorrent-enhanced-nox'
           'qbittorrent-enhanced-nox-git'
           'qbittorrent-enhanced-qt5'
           'qbittorrent-enhanced-ua'
           'qbittorrent-git'
           'qbittorrent-nox-git'
           'qbittorrent-qt5')
_srcrepodir="${pkgname%-qt5-git*}"
source=("${_srcrepodir}::git+${url}.git#branch=v4_4_x")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcrepodir}"

# Generate git 'release-' tag based version.
  git describe --long --tags --match='release-*' | sed 's/^release-//;s/^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)/\1\2/;s/\([0-9]\+-g\)/r\1/;s/-/./g'
}

prepare() {
  printf 'Checking if ccache is enabled for makepkg... '

  if check_buildoption "ccache" "y"; then
    printf 'yes\n'
    printf 'Enabling C++ ccache for CMake...\n'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  else
    printf 'no\n'
  fi

  printf 'Configuring build with CMake...\n\n'
  export CXXFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS

  cmake -S "${_srcrepodir}" \
    -B 'build' \
    -G 'Ninja' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DQT6='OFF' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DVERBOSE_CONFIGURE='ON'
}

build() {
  printf 'Building with CMake...\n\n'
  cmake --build 'build'
}

package() {
  printf 'Installing with CMake...\n\n'
  DESTDIR="${pkgdir}" cmake --install 'build'
  install -Dm644 "${_srcrepodir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
