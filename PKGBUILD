# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.10.35
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL-2.0-or-later')
depends=('libxml++2.6' 'xmlsec' 'imagemagick' 'libharu>=2.4.5'  'openjpeg2>=2.5' 'libcxml>=0.17.15' 'libsigc++>=2.0' 'boost-libs>=1.89.0' 'xerces-c'  'libasdcp-cth>=1.0.8')
makedepends=('git' 'python' 'boost>=1.89.0' 'gcc' 'pkg-config' 'fast_float>=7.0')
_cherrypicks=()
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}")
sha256sums=('9119a2d495de2be0fff0eaac1069393503c554402d657132d699bbede18ee67e')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ### Cherry pick upstream commits (fixes and such) ###
  for c in "${_cherrypicks[@]}"; do
      echo "Applying commit ${c}"
      git cherry-pick "${c}";
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
  python waf configure --prefix=/usr --disable-tests --disable-examples --disable-benchmarks --disable-dumpimage
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
