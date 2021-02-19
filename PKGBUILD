# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archdaemon
# Contributor: sekret

pkgname=untrunc-git
pkgver=r142.e02f40e
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
	"http://libav.org/releases/libav-${libav_version}.tar.xz")
md5sums=('SKIP'
         '7f6cf1762cd93f4ce84cb218ab856ea3'
         '753ec26481b0582eb737383bd8a350a5')
noextract=("libav-${libav_version}.tar.xz")

prepare() {
  cd $srcdir/$pkgname
  tar xvJf ../libav-${libav_version}.tar.xz
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
