# Maintainer: Spyros Stathopoulos <foucault.online[at]gmail[dot]com>
# Contributor: Jon Wilson <bugs@pandorica.net>
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-lua-nv
_pkgname=conky
pkgver=1.19.8
pkgrel=1
pkgdesc="Lightweight system monitor for X with lua and nvidia enabled"
arch=('i686' 'x86_64')
url="https://github.com/brndnmtthws/conky"
license=('GPL' 'BSD')
replaces=('torsmo' 'conky')
conflicts=('conky')
provides=('conky' 'conky-lua')
depends=(
  'glibc' 'glib2' 'cairo' 'lua' 'wireless_tools' 'libxdamage' 'libxinerama' 'libxft' 'imlib2'
  'libxml2' 'ncurses' libncursesw.so 'libxnvctrl' libXNVCtrl.so 'systemd-libs' libsystemd.so
  'libpulse' libpulse.so 'curl' libcurl.so 'fontconfig' 'gcc-libs' 'libx11' 'libxdamage'
  'pango' 'wayland')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git' 'catch2'
             'pandoc' 'python-yaml' 'python-jinja' 'wayland-protocols')
optdepends=('nvidia: for NV11 and newer GPUs',
  'nvidia-470xx-dkms: for NVE0 (Maxwell) GPUs',
  'nvidia-390xx-dkms: for NVC0 and GF1XX (Fermi) GPUs'
  'nvidia-340xx-dkms: for NV40 and G70 (Curie) GPUs')
source=("https://github.com/brndnmtthws/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('acd122047f7c1b273192e599f25fcb99e1eccb81')
install='conky-lua-nv.install'

prepare() {
  # disable HSV gradients for now
  cd ${srcdir}/${_pkgname}-${pkgver}
  rm -r tests/catch2
  ln -s /usr/include/catch2 tests
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
    -D MAINTAINER_MODE=OFF \
    -D BUILD_DOCS=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_EXTRAS=ON \
    -D BUILD_LUA_RSVG=ON \
    -D BUILD_LUA_CAIRO=ON \
    -D BUILD_LUA_IMLIB2=ON \
    -D BUILD_WLAN=ON \
    -D BUILD_XDBE=ON \
    -D BUILD_XSHAPE=ON \
    -D BUILD_HSV_GRADIENT=ON \
    -D BUILD_IMLIB2=ON \
    -D BUILD_CURL=ON \
    -D BUILD_RSS=ON \
    -D BUILD_NVIDIA=ON \
    -D BUILD_PULSEAUDIO=ON \
    -D BUILD_JOURNAL=ON \
    -D BUILD_WAYLAND=ON \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -S .

  make -C build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make -C build DESTDIR=${pkgdir} install
  install -D -m644 COPYING -t ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 build/extras/vim/syntax/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/syntax/
  install -D -m644 extras/vim/ftdetect/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/
}

# vim:ts=2:et:sw=2
