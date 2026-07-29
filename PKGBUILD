# Maintainer: Benjamin Radel <aur@radel.tk>
# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libttf
pkgver=0.0.7
pkgrel=1
pkgdesc="A small C++ library to render subtitles for Digital Cinema Packages with DCP-o-matic"
arch=('i686' 'x86_64')
url="https://www.dcpomatic.com"
license=('GPL-2.0-or-later')
depends=('boost-libs>=1.91.0' 'libstdc++' 'fmt')
makedepends=('git' 'python' 'boost>=1.91.0' 'gcc' 'pkg-config')
_cherrypicks=()
source=("${pkgname}-${pkgver}::git+https://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}")
sha256sums=('6e5a1d83752d74b0ce191f01962eda40eafbea88a5c1217576f6f76e9d6914ae')
provides=('libttf-1.0.so')

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
  python waf configure --prefix=/usr 
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
