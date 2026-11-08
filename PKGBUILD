# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=dcmtk
pkgname="${_pkgname}"-git
pkgver=3.7.1.r76.g851f21f97
pkgrel=1
pkgdesc='Collection of libraries and applications implementing large parts the DICOM standard'
arch=('i686' 'x86_64' 'aarch64')
url='https://www.dcmtk.org'
license=('custom')
depends=('libxml2' 'icu' 'libwrap' 'libtiff' 'libpng' 'openjpeg2')
makedepends=('git' 'cmake' 'doxygen')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/dcmtk-${pkgver%.r*}-DEV/"{dcmpstat,dcmqrprf,dcmqrscp,filelog,logger,printers,storescp,storescu}.cfg)
source=("git+https://github.com/dcmtk/dcmtk.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's/^DCMTK-//;s/-/.r/;s/-/./'
}

build() {
  rm -Rf build && mkdir -p build
  cd build
  cmake "${srcdir}"/${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON
  make
  make html
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}"/${_pkgname}/COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
