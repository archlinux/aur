# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.10.23
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL-2.0-or-later')
depends=('libxml++2.6' 'xmlsec' 'imagemagick' 'openjpeg2>=2.5' 'libcxml>=0.17.13' 'libsigc++>=2.0' 'boost-libs>=1.88.0' 'xerces-c'  'libasdcp-cth>=1.0.6')
makedepends=('git' 'python' 'boost>=1.88.0' 'gcc' 'pkg-config' 'fast_float>=7.0')
_cherrypicks=()
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}")
sha256sums=('191b4cdb9073125fe8eceb927943dcf32ae59789ec83e29a1c8b65fa542a58ba')

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
