# $Id: PKGBUILD 228104 2017-05-15 15:08:35Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf lonewolf@xs4all.nl

pkgname=vdrift
pkgver=2014.10.20
pkgrel=9
pkgdesc="Open source driving simulation made with drift racing in mind"
arch=('i686' 'x86_64')
url="http://vdrift.net/"
license=('GPL')
depends=('bullet' 'curl' 'sdl2_image' 'glew' 'libvorbis' 'hicolor-icon-theme' 'libarchive')
makedepends=('scons' 'mesa')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver//./-}.tar.bz2
        vdrift-gcc6.patch)
sha512sums=('5f6afbb4bdc273455f6bf4e3eba6e3b702d96fbe3c7b5068cee0c114d5de28b82ceed44ee891f59e9bfe194f0c597f464a13aadf7f34b204630ec54df282e4ee'
            '4f77497aa3d1b9299028fa58fec2a42ca47b2dd5f132581d408bad7b7ca77b76f2b6c5fb89b4ac4e72b546c4e993addf55445c49b3f5f00a75bace0dd12b9753')

prepare() {
  cd vdrift
  # Fix build with GCC 6 (Fedora)
  patch -p1 -i ../vdrift-gcc6.patch
}

build() {
  cd vdrift

  # build and install
  scons $MAKEFLAGS \
    "destdir"="$pkgdir" \
    "release"=1 \
    "force_feedback"=1 \
    "prefix"=/usr \
    "datadir"=share/$pkgname/ \
    "extbullet"=1
}

package() {
  cd vdrift

  scons install

  # install .desktop file
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  sed -i '1 s/^\xef\xbb\xbf//' "$pkgdir"/usr/share/applications/$pkgname.desktop # remove BOM (WHY IS THERE?)

  # install icons
  install -Dm644 data/textures/icons/vdrift-16x16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/vdrift.png
  install -Dm644 data/textures/icons/vdrift-32x32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/vdrift.png
  install -Dm644 data/textures/icons/vdrift-64x64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/vdrift.png
  install -Dm644 data/textures/icons/vdrift-64x64.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
# vim: sw=2:ts=2 et:
