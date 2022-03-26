# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname=qbittorrent-enhanced-qt5-git
pkgver=4.4.2.10.r0.gdb18496c9
pkgrel=2
pkgdesc='Bittorrent client using Qt5 and libtorrent-rasterbar, Enhanced Edition mod'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/c0re100/qBittorrent-Enhanced-Edition'
license=('custom:GPL with OpenSSL exception')
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
  cmake -S "${_srcrepodir}" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DVERBOSE_CONFIGURE=ON
}

build() {
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_srcrepodir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
