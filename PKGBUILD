# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.16.22
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
depends=('xorgproto' 'libsub>=1.6.28' 'libcxml>=0.17.3' 'libdcp>=1.8.25' 'ffmpeg>=4.0.2' 'glib2' 'imagemagick' 'libssh'  'wxwidgets-gtk3' 'wxwidgets-common' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264' 'openssl' 'leqm-nrt>=0.0.2.r8.g93ae9e6')
makedepends=('python' 'which' 'boost>=1.78.0' )
source=("${pkgname}-${pkgver}.tar.bz2::https://dcpomatic.com/dl.php?id=source&version=${pkgver}"
        "0001-set-version.patch"
        "0002-fix-missing-include.patch" )

sha256sums=('3591bd727e99abfa506c572edb794732b3238952ba8f06d39773b12e878c3d8f'
            '21f83b2b6850a6fb717ff2815f53148b68efa83882c89e664c721d737afb0040'
            'b74cb3fd8ebe3c47dd045a63e1ab04d597e0da4379f0ed5d461ad844fe980556' )

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
