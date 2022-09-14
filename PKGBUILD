# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.8.27
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="https://carlh.net/libdcp"
license=('GPL')
depends=('libxml++2.6' 'xmlsec' 'imagemagick' 'openjpeg2>=2.5' 'libcxml>=0.17.3' 'libsigc++>=2.0' 'boost-libs>=1.72.0' 'libasdcp-cth>=0.1.6.r18.ga276ed1')
makedepends=('git' 'python' 'boost>=1.72.0' 'gcc' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::https://git.carlh.net/gitweb/?p=${pkgname}.git;a=snapshot;h=v${pkgver};sf=tgz"
	"0001-fix-compile-with-openjp25.patch")
sha256sums=('a51dd14d864fd5356a16b6e43542ef1ef5aced5d2d55ff5b2bcb751ddd170c7c'
            '671046a87eaf567ca94cde72a92497239155d7cb12450ee12b41b2eed13c78fb')

prepare() {
  mv "${srcdir}/${pkgname}-v${pkgver}-"* "${srcdir}/${pkgname}-${pkgver}"
  cd $srcdir/${pkgname}-${pkgver}
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
