# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: benklett <b.klettbach@gmail.com>

pkgname=libjpeg9
pkgver=9f
pkgrel=1
pkgdesc="JPEG image compression"
arch=('x86_64')
url="http://www.ijg.org/"
license=('LicenseRef-custom')
depends=('glibc')
makedepends=('libtool')
source=("http://www.ijg.org/files/jpegsrc.v${pkgver}.tar.gz")
sha256sums=('04705c110cb2469caa79fb71fba3d7bf834914706e9641a4589485c1f832565b')

build() {
  cd "jpeg-${pkgver}"
  ./configure --prefix=/usr --enable-shared --enable-static
  make
}

check() {
  cd "jpeg-${pkgver}"
  make -k check
}

package() {
  cd "jpeg-${pkgver}"
  make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man" install
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 README "${pkgdir}/usr/share/licenses/libjpeg9/README"
  # Copy header files
  install -m 755 -d "${pkgdir}/usr/include/${pkgname}"
  install -m 644 jpegint.h "${pkgdir}/usr/include/${pkgname}"
  
  cd "${pkgdir}"
  # Remove static libraries
  rm "usr/lib/libjpeg.a"
  rm "usr/lib/libjpeg.so"
  rm "usr/lib/libjpeg.la"
  # Rename pkgconfig libraries
  mv "usr/lib/pkgconfig/libjpeg.pc" "usr/lib/pkgconfig/${pkgname}.pc"
  # Rename binary executables
  for _file in usr/bin/*
  do
    mv ${_file} ${_file}9
  done
  # Rename man pages
  for _file in usr/share/man/man1/*
  do
    mv ${_file} ${_file%.1}9
  done
  # Move header files
  mv usr/include/*.h "usr/include/${pkgname}"
} 
