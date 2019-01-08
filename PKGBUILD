# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='xcb-util-cursor-git'
pkgver=0.1.3.r1.g947eaba
pkgrel=1
pkgdesc='XCB cursor library'
arch=('x86_64')
url='https://xcb.freedesktop.org/'
license=('MIT')
depends=('libxcb' 'xcb-util-renderutil' 'xcb-util-image')
makedepends=('git' 'xorg-util-macros' 'gperf')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=(
 'git+https://anongit.freedesktop.org/git/xcb/util-cursor.git'
 'git+https://anongit.freedesktop.org/git/xcb/util-common-m4.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd util-cursor

  git describe --long --tags \
    | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd util-cursor

  git submodule init "m4"
  git config "submodule.m4.url" "../util-common-m4"
  git submodule update "m4"
}

build() {
  cd util-cursor

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd util-cursor
  
  DESTDIR="${pkgdir}" make install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
