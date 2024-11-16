# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: mrdotx <klassiker@gmx.de>
# Contributor: Hendrik Schick <hendrik@hndrkk.sh>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Beini <bane@iki.fi>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-git
pkgver=1.21.8.r2.ga0ee703
pkgrel=2
pkgdesc="Lightweight system monitor for X"
arch=(x86_64)
url="https://github.com/brndnmtthws/conky"
license=('BSD-3-Clause' 'GPL-3.0-or-later')
depends=(
    glibc
    lua
    wireless_tools
    libxdamage
    libxinerama
    libxft
    imlib2
    libxml2
    libpulse
    libxnvctrl
    systemd-libs
    ncurses
    curl
    libncursesw.so
    libXNVCtrl.so
    libsystemd.so
    libpulse.so
    libcurl.so
)
makedepends=(
    cmake
    docbook2x
    docbook-xsl
    man-db
    git
    glib2-devel
    gperf
    catch2-v2
    pandoc
    python-yaml
    python-jinja
)

provides=(conky)
conflicts=(conky)
source=("git+https://github.com/brndnmtthws/conky.git")
sha256sums=('SKIP')

pkgver() {
  cd "conky"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "conky"
  # Unbundle catch2 to fix build with glibc 2.35
  rm -r tests/catch2
  ln -s /usr/include/catch2 tests
}

build() {
  local _flags=(
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -D MAINTAINER_MODE=ON
    -D BUILD_DOCS=ON
    -D BUILD_WLAN=ON
    -D BUILD_XDBE=ON
    -D BUILD_XSHAPE=ON
    -D BUILD_IMLIB2=ON
    -D BUILD_CURL=ON
    -D BUILD_RSS=ON
    -D BUILD_NVIDIA=ON
    #-D BUILD_WEATHER_METAR=ON
    -D BUILD_PULSEAUDIO=ON
    -D BUILD_JOURNAL=ON
  )

  cmake -B build -S "conky" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd "conky"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"

  install -Dm644 extras/vim/syntax/conkyrc.vim.j2 -t \
        "$pkgdir"/usr/share/vim/vimfiles/syntax/
  install -Dm644 extras/vim/ftdetect/conkyrc.vim -t \
        "$pkgdir"/usr/share/vim/vimfiles/ftdetect/
}
