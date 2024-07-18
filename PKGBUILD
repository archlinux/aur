# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.16.89
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
license=('GPL-2.0-or-later')
depends=('libsub>=1.6.49' 'libcxml>=0.17.6' 'libdcp>=1.8.101' 'ffmpeg4.4' 'glib2' 'glu' 'icu' 'imagemagick' 'libssh'  'wxwidgets-gtk3' 'wxwidgets-common' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264' 'openssl' 'leqm-nrt>=0.0.2.r12.g30dcaea' 'icu')
makedepends=('python' 'which' 'boost>=1.78.0' 'git')
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}"
)
sha256sums=('cddfbfbf59df5c90c2d86b9d4ddbaf6879e68ae8f4dae9867ba1d773ae624d58')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ## Set Version in Source
  # sed -i "/^\+VERSION/ s/XXXXXX/${pkgver}/" ${srcdir}/0001-set-version.patch
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "${srcdir}/${p##*/}"
    fi
  done
}


 build() {
   # Current DoM is broken with ffmpeg 7, fallback on ffmpeg 4.4 for now
   export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
   cd "${srcdir}/${pkgname}-${pkgver}"
   python waf configure --prefix=/usr --disable-tests
   python waf build
 }

 package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python waf install --destdir="$pkgdir"
   cd "${pkgdir}"
   if [ -d usr/lib64  ]
   then
     mv usr/lib64 usr/lib
   fi
   ln -s "$(which openssl)" usr/bin/dcpomatic2_openssl
 }
