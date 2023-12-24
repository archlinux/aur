# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

_pkgbase='qbittorrent-enhanced'
pkgname="${_pkgbase}-qt5-git"
pkgver=4.6.2.10.r2.gebcb91e08
pkgrel=2
pkgdesc='Bittorrent client using Qt5 and libtorrent-rasterbar, Enhanced Edition mod (git)'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/c0re100/qBittorrent-Enhanced-Edition'
license=('custom:GPL2+-with-OpenSSL-exception')
depends=('dbus'
         'gcc-libs'
         'glibc'
         'hicolor-icon-theme'
         'libtorrent-rasterbar'
         'qt5-base'
         'zlib')
makedepends=('boost'
             'cmake'
             'ninja'
             'openssl'
             'qt5-svg'
             'qt5-tools')
optdepends=('python: to use torrent search plugins')
provides=('qbittorrent'
          'qbittorrent-enhanced'
          'qbittorrent-enhanced-qt5'
          'qbittorrent-qt5')
conflicts=('qbittorrent')
source=("${_pkgbase}::git+${url}.git#branch=v4_6_x")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match='release-*' | sed -e 's|^release-||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected pkgver format: e.g. 4.6.2.10.r2.gebcb91e08
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g'
}

prepare() {
  echo 'Reverting commit: "add TS (torrent storm) to peer blacklist"...'
  echo '(This re-enables seeding to Popcorn Time media player.)'
  (
    cd "${_pkgbase}"
    git revert --no-commit dbf3359f2c2cb30d107a1dc1af00e2ff7dd545a5
    echo
  )

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

  cmake -S "${_pkgbase}" \
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
  depends+=('libcrypto.so')
  printf 'Installing with CMake...\n\n'
  DESTDIR="${pkgdir}" cmake --install 'build'
  install -Dm644 "${_pkgbase}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
