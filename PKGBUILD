# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archdaemon
# Contributor: sekret
# Contributor: qubidt

pkgname=untrunc-git
pkgver=r184.8ae3c90
pkgrel=1
libav_version=12.3
pkgdesc="restore a damaged (truncated) mp4, m4v, mov, 3gp video"
arch=('x86_64' 'i686')
url="https://github.com/ponchio/untrunc"
license=('GPL2')
depends=('libvdpau' 'zlib' 'bzip2')
makedepends=('yasm' 'git' 'libx11')
source=("${pkgname}"::'git+https://github.com/ponchio/untrunc.git'
        'framealloc.patch'
  "libav-${libav_version}.tar.gz::https://github.com/libav/libav/archive/refs/tags/v${libav_version}.tar.gz"
  mathops.patch::https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/effadce6c756247ea8bae32dc13bb3e6f464f0eb)
md5sums=('SKIP'
         '7f6cf1762cd93f4ce84cb218ab856ea3'
         '78f791a4f595a67abd3a7d0c976524c5'
         'adf42203d59a3c98a863216113946661')
noextract=("libav-${libav_version}.tar.gz")

prepare() {
  cd $srcdir/$pkgname
  tar xf ../libav-${libav_version}.tar.gz
  cd libav-${libav_version}
  patch -p1 -i ../../mathops.patch
}

build() {
  cd $srcdir/$pkgname
  git submodule init
  git submodule update
  # patch -p1 -i $srcdir/framealloc.patch
  # wget http://libav.org/releases/libav-${libav_version}.tar.xz
  cd libav-"${libav_version}"
  ./configure
  make
  cd ..
  g++ -o untrunc -I./libav-${libav_version} file.cpp main.cpp track.cpp atom.cpp codec_*.cpp codecstats.cpp codec.cpp mp4.cpp log.cpp -L./libav-${libav_version}/libavformat -lavformat -L./libav-${libav_version}/libavcodec -lavcodec -L./libav-${libav_version}/libavresample -lavresample -L./libav-${libav_version}/libavutil -lavutil -lpthread -lz -lbz2 -llzma -lX11 -lvdpau -ldl
} 

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 $srcdir/$pkgname/untrunc $pkgdir/usr/bin/untrunc
}
