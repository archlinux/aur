#Maintainer: M. Mastroeni <the_maxtro AT hotmail DOT it>
pkgname=gimp-gap
pkgver=2.7
pkgrel=2
pkgdesc="Gimp Animation Package, gimp's plugin for animation"
url="https://www.gimp.org/tutorials/Using_GAP/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gimp>=2.6.0' 'glib2')
makedepends=('intltool' 'git')
optdepends=('xvidcore: compression codec' 
            'lbzip2: data compressor' 
            'faac: audio encoder' 
            'faad2: audio decoder' 
            'lame: mpeg layer 3 codec' 
            'libx264: H264 codec'
            'mplayer: frames extraction')
options=(!buildflags)
source=('git+https://gitlab.gnome.org/Archive/gimp-gap.git'
         effadce6c756247ea8bae32dc13bb3e6f464f0eb.patch::https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/effadce6c756247ea8bae32dc13bb3e6f464f0eb)
md5sums=('SKIP'
         '955ac456a53dbb221b7e2a87ab5a93f6')

prepare() {
  cd $pkgname
  bsdtar -xf extern_libs/ffmpeg.tar.gz -C extern_libs
  # fix building with binutil >= 2.41
  patch -Np1 -i "$srcdir/effadce6c756247ea8bae32dc13bb3e6f464f0eb.patch" -d extern_libs/ffmpeg
  # fix library linking order
  sed -i 's/$FFMPEG_LIBAVUTIL_A $FFMPEG_LIBSWSCALE_A/$FFMPEG_LIBSWSCALE_A $FFMPEG_LIBAVUTIL_A/' configure.in
  autoreconf -vfi
}

build() {
  cd $pkgname
  export LIBS='-lm'
  ./configure --prefix=/usr --with-ffmpegsrcdir="$PWD"/extern_libs/ffmpeg
  make -j1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
