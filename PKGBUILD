# Maintainer: envolution
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Coenraad van der Westhuizen <chwesthuizen@gmail.com>
# Contributor: hm_b <holger (at) music-nerds (dot) net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=canorus
pkgver=0.7.3rc3
pkgrel=7
pkgdesc="A free music score editor"
arch=('x86_64')
url="http://www.canorus.org/"
license=('GPL-3.0-or-later')
depends=('qt5-svg' 'qt5-webengine' 'alsa-lib' 'zlib' 'python')
makedepends=('cmake' 'swig' 'qt5-tools' 'ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/canorusmusic/canorus/archive/refs/tags/${pkgver}.zip"
  swigpython-py313.patch pyconsole-py313.patch)
sha256sums=('a4f54c96172e02d799b30b0939ecea3e43d9b99511e556b208d1811ea3330e41'
            '0e7b5c0b0ac5a1288206f68c06609a0278d58057a3660419ff59c1bdca0faa79'
            '2881c11137e6d005ade7f2715e8a41136eb5c9a6bfffaa89ae3ea4bbac05c0cf')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -i ../swigpython-py313.patch
  patch -Np2 -i ../pyconsole-py313.patch
}

build() {
  cd $pkgname-$pkgver
  # stringop-truncation will be fixes in swig, see https://github.com/swig/swig/issues/893
  export CXXFLAGS+=" -Wno-misleading-indentation -Wno-dangling-else -Wno-stringop-truncation -Wno-deprecated -Wno-deprecated-declarations"
  cmake . -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DDEFAULT_DATA_DIR="/usr/share/canorus"
}

package() {
  cd $pkgname-$pkgver
  make install
  install -d "$pkgdir"/usr/share/{applications,pixmaps}
  cp canorus.desktop "$pkgdir"/usr/share/applications
  cp "$pkgdir"/usr/share/{canorus/images/clogosm.png,pixmaps/canorus.png}
}
# vim:set ts=2 sw=2 et:
