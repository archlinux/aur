# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=cinelerra-cv-git
pkgver=2.3.r385.g7d0e8ede
pkgrel=2
pkgdesc="Professional video editing and compositing environment - Community version"
arch=(x86_64)
url="https://github.com/cinelerra-cv-team/cinelerra-cv/"
license=(GPL)
depends=(e2fsprogs libavc1394 libiec61883 libxv
         libtiff mjpegtools fftw a52dec glu
         ffmpeg faad2 faac openexr libxft)
makedepends=(git automake nasm mesa intltool gcc9)
provides=(cinelerra-cv)
conflicts=(cinelerra-cv)
source=("${pkgname}::git+https://github.com/cinelerra-cv-team/cinelerra-cv.git"
        "https://github.com/cinelerra-cv-team/cinelerra-cv/pull/2/commits/71fb05327d17a76d5735416a48d6175a6bac235a.patch")
sha512sums=('SKIP'
            'ffd8300125fae98109d297905e000f5a91762df21f15de36968ad103419e08cfef5c701ecd9c1ed716f7637b9156a6668b9da597754483665d1091af99d28827')

export CC=/usr/bin/gcc-9 CXX=/usr/bin/g++-9
pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
#  patch -Np1 -i ../71fb05327d17a76d5735416a48d6175a6bac235a.patch
  ./autogen.sh
}

build() {
  cd "${pkgname}"
  # disable mmx due to improper use of registers in asm
  # - possibly a new problem since gcc 4.9
  ./configure pkg_config='pkg-config --static' \
    --prefix=/usr \
    --with-buildinfo=git \
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
