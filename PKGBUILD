# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=cinelerra-cv
pkgver=2.3+459+g6ff8065f
pkgrel=1
epoch=2
pkgdesc="Professional video editing and compositing environment - Community version"
arch=(x86_64)
url="https://github.com/cinelerra-cv-team/cinelerra-cv/"
license=(GPL-2.0-only)
depends=(e2fsprogs libavc1394 libiec61883 libxv
         libtiff mjpegtools fftw a52dec glu
         ffmpeg faad2 faac openexr libxft)
makedepends=(git automake nasm mesa intltool)
source=("git+https://github.com/cinelerra-cv-team/cinelerra-cv.git#commit=6ff8065fa8e1776b69d15f4d2bf451154714bd51")
sha512sums=('5327044c76c974d59a1b7775c61f116d805b04cf91a369f4ab89e722f6c06f70ab70aa5355788977e94647f7a4251cd05e64dbc6a35cc71eee17c06aff94430e')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//g;s/-/+/g'
}

prepare() {
  cd "${pkgname}"
  ./autogen.sh
}

build() {
  cd "${pkgname}"
  # disable mmx due to improper use of registers in asm
  # - possibly a new problem since gcc 4.9
  ./configure pkg_config='pkg-config --static' \
    --prefix=/usr \
    --enable-opengl \
    --disable-mmx \
    --disable-esd
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {AUTHORS,ChangeLog,NEWS,README.BUILD,TODO}
}
