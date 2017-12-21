# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archdaemon

pkgname=untrunc-git
pkgver=r49.2259a05
pkgrel=1
pkgdesc="restore a damaged (truncated) mp4, m4v, mov, 3gp video"
arch=('x86_64' 'i686')
url="https://github.com/ponchio/untrunc"
license=('GPL2')
depends=('ffmpeg' 'qt5-base')
makedepends=('qconf' 'yasm')
source=("${pkgname}"::'git+https://github.com/ponchio/untrunc.git'
        'framealloc.patch'
	'http://libav.org/releases/libav-12.2.tar.xz')
md5sums=('SKIP'
         '7f6cf1762cd93f4ce84cb218ab856ea3'
         '69b5d9de6e4b2fbf6956653f61c7ffe1')
noextract=('libav-12.2.tar.xz')

prepare() {
  cd $srcdir/$pkgname
  tar xvJf ../libav-12.2.tar.xz
}

build() {
  cd $srcdir/$pkgname
  git submodule init
  git submodule update
  # patch -p1 -i $srcdir/framealloc.patch
  # wget http://libav.org/releases/libav-12.2.tar.xz
  cd libav-12.2
  ./configure
  make
  cd ..
  g++ -o untrunc file.cpp main.cpp track.cpp atom.cpp mp4.cpp -I./libav-12.2 -L./libav-12.2/libavformat -lavformat -L./libav-12.2/libavcodec -lavcodec -L./libav-12.2/libavresample -lavresample -L./libav-12.2/libavutil -lavutil -lpthread -lz -lbz2 -lX11 -lvdpau
} 

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 $srcdir/$pkgname/untrunc $pkgdir/usr/bin/untrunc
}
