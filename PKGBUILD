# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp-git
pkgver=1.8.27.r1.gb36f9bf7
pkgrel=1
_branch=v1.8.x
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL')
depends=('libxml++2.6' 'xmlsec' 'imagemagick' 'openjpeg2>=2.5' 'libcxml-git' 'libsigc++>=2.0' 'boost-libs>=1.72.0' 'libasdcp-cth-git')
makedepends=('git' 'python' 'boost>=1.72.0' 'gcc' 'pkg-config')
provides=('libdcp')
conflicts=('libdcp')
source=("${pkgname}::git+git://git.carlh.net/git/libdcp.git#branch=${_branch}"
	"0001-fix-compile-with-openjp25.patch")
sha256sums=('SKIP'
            '671046a87eaf567ca94cde72a92497239155d7cb12450ee12b41b2eed13c78fb')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd $srcdir/${pkgname}
  ### Patch libdcp for openjpeg>2.5 ###
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "${srcdir}/${p##*/}"
    fi
  done
}

build() {
  ### Configure libdcp ###
  cd "${srcdir}/${pkgname}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd "${srcdir}/${pkgname}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
