# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic-git
_branch=main
pkgver=2.16.24.r9.gf44e5e0b2
pkgrel=1
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
license=('GPL')
depends=('xorgproto' 'libsub-git' 'libcxml-git' 'libdcp-git' 'ffmpeg>=4.0.2' 'glib2' 'imagemagick' 'libssh'  'wxwidgets-gtk3' 'wxwidgets-common' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264' 'openssl' 'leqm-nrt-git')
makedepends=('python' 'which' 'boost>=1.78.0' )
source=("${pkgname}::git+git://git.carlh.net/git/dcpomatic.git#branch=${_branch}")

sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${pkgname}"
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "${srcdir}/${p##*/}"
    fi
  done
}


 build() {
   cd "${srcdir}/${pkgname}"
   python waf configure --prefix=/usr --disable-tests
   python waf build
 }

 package() {
   cd "${srcdir}/${pkgname}"
   python waf install --destdir=$pkgdir
   cd "${pkgdir}"
   if [ -d usr/lib64  ]
   then
     mv usr/lib64 usr/lib
   fi
   ln -s $(which openssl) usr/bin/dcpomatic2_openssl
 }
