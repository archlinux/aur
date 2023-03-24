# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: Hendrik Schick <hendrik@hndrkk.sh>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Beini <bane@iki.fi>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>
_pkgname=conky
pkgname=conky-git
pkgver=1.18.3.r14.ga9cecaf9
pkgrel=1
pkgdesc="Lightweight system monitor for X"
url="https://github.com/brndnmtthws/conky"
license=('BSD' 'GPL')
arch=('x86_64')
makedepends=(
    'cmake'
    'docbook2x'
    'docbook-xsl'
    'man-db'
    'git'
    'catch2'
    'pandoc'
    'python-yaml'
    'python-jinja'
)
depends=(
    'glibc'
    'glib2'
    'lua'
    'wireless_tools'
    'libxdamage'
    'libxinerama'
    'libxft'
    'imlib2'
    'libxml2'
    'libpulse'
    'libxnvctrl'
    'systemd-libs'
    'ncurses'
    'curl'
    libncursesw.so
    libXNVCtrl.so
    libsystemd.so
    libpulse.so
    libcurl.so
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/brndnmtthws/conky.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"

    # Unbundle catch2 to fix build with glibc 2.35
    rm -r tests/catch2
    ln -s /usr/include/catch2 tests
}

build() {
    cd "$srcdir/$pkgname"

    cmake \
        -B build \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
        -D MAINTAINER_MODE=ON \
        -D BUILD_DOCS=ON \
        -D BUILD_WLAN=ON \
        -D BUILD_XDBE=ON \
        -D BUILD_XSHAPE=ON \
        -D BUILD_IMLIB2=ON \
        -D BUILD_CURL=ON \
        -D BUILD_RSS=ON \
        -D BUILD_NVIDIA=ON \
        -D BUILD_WEATHER_METAR=ON \
        -D BUILD_PULSEAUDIO=ON \
        -D BUILD_JOURNAL=ON \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -S .

    make -C build
}

package() {
    cd "$srcdir/$pkgname"
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 extras/vim/syntax/conkyrc.vim.j2 -t \
        "$pkgdir"/usr/share/vim/vimfiles/syntax/
    install -Dm644 extras/vim/ftdetect/conkyrc.vim -t \
        "$pkgdir"/usr/share/vim/vimfiles/ftdetect/
}
