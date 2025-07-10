# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgbase=dcpomatic
pkgver=2.18.20
provides=('dcpomatic')
conflicts=('dcpomatic')
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
license=('GPL-2.0-or-later')
depends=('libsub>=1.6.53' 'libcxml>=0.17.13' 'libdcp>=1.10.23' 'ffmpeg>=7.0' 'glib2' 'glu' 'icu' 'imagemagick' 'libssh'  'wxwidgets-gtk3' 'wxwidgets-common' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264' 'openssl' 'leqm-nrt>=0.0.2.r12.g30dcaea' 'xerces-c' 'libxml++2.6' 'gtkmm3' 'cairomm')
makedepends=('python' 'which' 'boost>=1.86.0' 'git' )
source=("${pkgname}::git+git://git.carlh.net/git/${pkgbase}.git#tag=v${pkgver}")

sha256sums=('e2ac86c4afc135bd32ed9b500e20edf39a30df782b5fddc4174c23d4d0d52f06')

# Pull fixes until new major release is available
_cherry_picks=() 

prepare() {
  cd "${srcdir}/${pkgname}"
  ## Set Version in Source
  # sed -i "/^\+VERSION/ s/XXXXXX/${pkgver}/" ${srcdir}/0001-set-version.patch
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "${srcdir}/${p##*/}"
    fi
  done

  for commit in "${_cherry_picks[@]}"; do
    git cherry-pick "${commit}"
  done
}


 build() {
   cd "${srcdir}/${pkgname}"
   python waf configure --prefix=/usr --disable-tests
   python waf build
 }

 package() {
   cd "${srcdir}/${pkgname}"
   python waf install --destdir="$pkgdir"
   cd "${pkgdir}"
   if [ -d usr/lib64  ]
   then
     mv usr/lib64 usr/lib
   fi
   ln -s "$(which openssl)" usr/bin/dcpomatic2_openssl
 }

# vim:set ts=2 sw=2 et:
