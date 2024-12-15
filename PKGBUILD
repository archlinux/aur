# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=cinelerra-cv-git
pkgver=2.3.r459.g6ff8065f
pkgrel=1
pkgdesc="Professional video editing and compositing environment - Community version"
arch=(x86_64)
url="https://github.com/cinelerra-cv-team/cinelerra-cv/"
license=(GPL-2.0-only)
depends=(libavc1394 libiec61883 libxv
         libtiff mjpegtools fftw a52dec glu
         faad2 faac openexr libxft

         # namcap implicit depends
         glibc gcc-libs
         libdv libxxf86vm bzip2 lame zlib util-linux-libs libvorbis x264 libsndfile libxext libglvnd libx11
         libogg libraw1394 libjpeg-turbo libtheora libpng alsa-lib
)
makedepends=(git automake nasm mesa intltool)
provides=(cinelerra-cv)
conflicts=(cinelerra-cv)
source=("git+https://github.com/cinelerra-cv-team/cinelerra-cv.git")
sha512sums=('SKIP')
#options=(!lto)

pkgver() {
  cd cinelerra-cv
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/cinelerra-cv"
  ./autogen.sh
}

build() {
  cd cinelerra-cv
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
  cd cinelerra-cv
  make DESTDIR="$pkgdir" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {AUTHORS,ChangeLog,NEWS,README.BUILD,TODO}
}
