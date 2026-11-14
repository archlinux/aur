# Maintainer: Christian Finnberg <christian@finnberg.net>
# Based on the work of: Andreas Radke <andyrtr@archlinux.org>

pkgname=libcupsfilters2.1
_pkgname=libcupsfilters
pkgver=2.1.2
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters 2.1.X branch - contains all the code of the filters of the former cups-filters package as library functions"
arch=('x86_64')
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache-2.0 WITH LLVM-exception')
depends=('libcups' 'libexif' 'libjxl' 'qpdf' 'poppler'
         'libjpeg-turbo' 'libpng' 'libtiff' 'lcms2'
         'fontconfig' 'glibc' 'libstdc++' 'libgcc' 'dbus')
makedepends=(
	'ghostscript' 
)
checkdepends=('ttf-dejavu')
provides=("${_pkgname}")
conflicts=('libcupsfilters')
source=("https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/${_pkgname}-$pkgver.tar.xz")
sha256sums=('cd1f0003af7cc35beeb4e7b13cb4392b53b9885684bd8b60099036ef0587e54f')

build() {
  cd "${_pkgname}"-$pkgver
  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${_pkgname}"-$pkgver
  make check
}

package() {
  cd "${_pkgname}"-$pkgver
  make DESTDIR="$pkgdir/" install
  # license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  install -m644 "${srcdir}"/${_pkgname}-${pkgver}/{COPYING,NOTICE} "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
