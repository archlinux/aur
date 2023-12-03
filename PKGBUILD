# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.8.89
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL')
depends=('libxml++2.6' 'xmlsec' 'imagemagick' 'openjpeg2>=2.5' 'libcxml>=0.17.5' 'libsigc++>=2.0' 'boost-libs>=1.72.0' 'xerces-c'  'libasdcp-cth>=0.1.6.r22.g8a4a2f2')
makedepends=('git' 'python' 'boost>=1.72.0' 'gcc' 'pkg-config')
_cherrypicks=()
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd $srcdir/${pkgname}-${pkgver}
  ### Cherry pick upstream commits (fixes and such) ###
  for c in "${_cherrypicks[@]}"; do
      echo "Applying commit ${c}"
      git cherry-pick ${c};
  done
  ### Apply patches ###
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "${srcdir}/${p##*/}"
    fi
  done
}

build() {
  ### Configure libdcp ###
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir="$pkgdir"
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
