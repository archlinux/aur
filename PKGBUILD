# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=vbam
pkgname=(
  vbam-sdl
  vbam-wx
)
pkgver=2.2.2
pkgrel=1
pkgdesc='Nintendo GameBoy Advance emulator'
arch=(x86_64)
url='https://visualboyadvance-m.org'
license=('GPL-2.0-only')
depends=(
  glu
  libgl
  libpng
  sdl2
  zlib
  openal
)
makedepends=(
  cmake
  ffmpeg
  git
  libglvnd
  ninja
  wxwidgets-gtk3
  zip
)
_pkgname=visualboyadvance-m
source=("git+https://github.com/${_pkgname}/${_pkgname}.git?signed#tag=v${pkgver}")
#source=("https://github.com/${_pkgname}/${_pkgname}/archive/v$pkgver.tar.gz")
b2sums=('b5f6cfc77af3c8b4c4c50d10c2ad26adf06d8cddba31ee1f0061cafdcd72fa6a79cdef8338ab019d8dd28bb540055f1391592ab288ddc829dbe74cc5a8ccb3ad')
validpgpkeys=('A0C0E526E36FD2138C149D4D08AB596679D86240' # Rafael Kitover <rkitover@gmail.com>
              'A4E3697D524B238DECCF3A17EB0E0FF1C62782D8' # Zach Bacon <zachbacon@vba-m.com>
)

prepare() {
  cd ${_pkgname}
  cp cmake/FindAppleFFMPEG.cmake cmake/FindFFMPEG.cmake
}

build() {
  cmake -S ${_pkgname} -B build-sdl -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DENABLE_SDL=TRUE \
    -DENABLE_WX=FALSE \
    -DENABLE_LINK=FALSE \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build-sdl

  cmake -S ${_pkgname} -B build-wx -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DENABLE_SDL=FALSE \
    -DENABLE_WX=TRUE \
    -DENABLE_FFMPEG=TRUE \
    -DENABLE_LINK=FALSE \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build-wx
}

package_vbam-sdl() {
  backup=(etc/vbam.cfg)
  conflicts=(vbam-wx)

  DESTDIR="${pkgdir}" cmake --install build-sdl
}

package_vbam-wx() {
  depends+=(
    glib2
    gtk3
    libavcodec.so
    libavformat.so
    libavutil.so
    libswscale.so
    openal
    wxwidgets-gtk3
    zip
    libxss
  )
  conflicts=(vbam-sdl)

  DESTDIR="${pkgdir}" cmake --install build-wx
}

# vim: ts=2 sw=2 et:
