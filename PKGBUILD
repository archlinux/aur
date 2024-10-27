# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=cinelerra-cv
pkgver=2.3+457+gc95830fc
pkgrel=1
epoch=2
pkgdesc="Professional video editing and compositing environment - Community version"
arch=(x86_64)
url="https://github.com/cinelerra-gg/cinelerra-cv/"
license=(GPL-2.0-only)
depends=(e2fsprogs libavc1394 libiec61883 libxv
         libtiff mjpegtools fftw a52dec glu
         ffmpeg faad2 faac openexr libxft)
makedepends=(git automake nasm mesa intltool)
source=("git+https://github.com/cinelerra-cv-team/cinelerra-cv.git#commit=c95830fc2e9910f484aa5e170e7af255bc77b60b")
sha512sums=('1e37dd596ec429eca0196bd4c57779df33234e547a01d6101df97a0953fd3408a33c3b2922e08f626c309957dd4a7ab2936bc3d22416da4c576fd554176a4a48')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//g;s/-/+/g'
}

prepare() {
  cd "${pkgname}"
  ./autogen.sh
}

build() {
  export CFLAGS+="  -Wno-incompatible-pointer-types"
  export CXXFLAGS+="  -Wno-incompatible-pointer-types"

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
