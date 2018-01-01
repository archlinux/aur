# Maintainer: goodguy <lists.cinelerra-cv.org>
pkgname=cin
pkgver=5.1
pkgrel=20171231
pkgdesc="Cinelerra git://git.cinelerra-cv.org/goodguy/cinelerra.git ($pkgrel)"
arch=('x86_64')
url="http://www.cinelerra-cv.org"
license=('GPL')
depends=('xorg-server' 'libpng' 'libxv' 'libva'
         'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'opencv')
makedepends=('yasm' 'nasm' 'cmake'
	 'libxml2' 'perl-xml-libxml' 'perl-xml-parser'  'wget' 'curl')
conflicts=()
source=('https://cinelerra-cv.org/five/src/cin_5.1.20171231-src.tgz' 
'unblock.patch' )
md5sums=('4f1ed25ba33cf708d90eb19f9ed5211e'
         '25541f98ed8565176ce466558c90b7eb')


prepare() {
  cd "$srcdir/cinelerra-5.1/"
  patch -Np1 -i ${srcdir}/unblock.patch
  sed -i 's/\<python\>/python2.7/' ./guicast/Makefile
}

build() {
  cd "$srcdir/cinelerra-5.1/"

  ./autogen.sh
  export FFMPEG_EXTRA_CFG=" --disable-vdpau" 
  ./configure --prefix=/usr --with-exec-name=$pkgname --with-jobs=12 --with-opencv=no
CFG_VARS="\
CFLAGS+=' -Wno-narrowing -O2 -g -fno-omit-frame-pointer' \
CXXFLAGS+=' -Wno-narrowing -O2 -g -fno-omit-frame-pointer' \
WERROR_CFLAGS+=' -fpermissive'" \
  make -j12


}

package() {
  cd "$srcdir/cinelerra-5.1/"
  
 make -j1 DESTDIR="$pkgdir" install

}
