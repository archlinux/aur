# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.14.57
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
depends=('pangomm>=1.4' 'xorgproto' 'libsub>=1.4.24' 'libcxml>=0.16.1' 'libdcp>=1.6.17' 'ffmpeg>=4.0.2' 'glib2' 'imagemagick' 'libssh'  'wxgtk2>=3.0.4'   'wxgtk-common' 'libquickmail>=0.1.29' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264')
makedepends=('python2' 'boost>=1.78.0' )
source=("${pkgname}-${pkgver}.tar.bz2::https://dcpomatic.com/dl.php?id=source&version=${pkgver}"
       "arch--boost-1.78.patch")
sha256sums=('f78b61ed9599bd4356cc6f16ea2b581285ffa8bfd778fd83427560b6be870489'
            '49f7e47fa714d348a2fd9830e89ddf9334908284433a72e9d56c8375958b748b')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/arch--boost-1.78.patch"
}


 build() {
   PKG_CONFIG_LIBDIR="/usr/lib64/pkgconfig/:/usr/lib/pkgconfig/:$PKG_CONFIG_LIBDIR"
   CXXFLAGS="$CXXFLAGS    -std=c++11 -O2 "

   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 waf configure   --prefix=/usr --disable-tests
   python2 waf build
 }

 package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python2 waf install --destdir=$pkgdir
   cd "${pkgdir}"
   if [ -d usr/lib64  ]
   then
     mv usr/lib64 usr/lib
   fi
 }
