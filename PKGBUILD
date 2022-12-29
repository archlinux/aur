# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.16.36
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
license=('GPL')
depends=('libsub>=1.6.42' 'libcxml>=0.17.3' 'libdcp>=1.8.47' 'ffmpeg>=4.0.2' 'glib2' 'glu' 'imagemagick' 'libssh'  'wxwidgets-gtk3' 'wxwidgets-common' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264' 'openssl' 'leqm-nrt>=0.0.2.r8.g93ae9e6')
makedepends=('python' 'which' 'boost>=1.78.0' )
source=("${pkgname}-${pkgver}.tar.bz2::https://dcpomatic.com/dl.php?id=source&version=${pkgver}"
        "0001-set-version.patch"
        )

sha256sums=('0b110138a0d6b6542bd9256b6dc20bdf5aa2c82ff76109c885cdcb65166e0bed'
            '21f83b2b6850a6fb717ff2815f53148b68efa83882c89e664c721d737afb0040'
           )

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ## Set Version in Source
  sed -i "/^\+VERSION/ s/XXXXXX/${pkgver}/" ${srcdir}/0001-set-version.patch
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "${srcdir}/${p##*/}"
    fi
  done
}


 build() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python waf configure --prefix=/usr --disable-tests
   python waf build
 }

 package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python waf install --destdir=$pkgdir
   cd "${pkgdir}"
   if [ -d usr/lib64  ]
   then
     mv usr/lib64 usr/lib
   fi
   ln -s $(which openssl) usr/bin/dcpomatic2_openssl
 }
