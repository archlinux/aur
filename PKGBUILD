# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: benklett <b.klettbach@gmail.com>

pkgname=libjpeg9
pkgver=9b
pkgrel=2
pkgdesc="JPEG image compression"
arch=('i686' 'x86_64')
url="http://www.infai.org/jpeg/"
license=('custom')
depends=('glibc')
makedepends=('libtool')
source=("jpegsrc.v${pkgver}.tar.gz"::"http://www.infai.org/jpeg/files?get=jpegsrc.v${pkgver}.tar.gz")
sha256sums=('240fd398da741669bf3c90366f58452ea59041cacc741a489b99f2f6a0bad052')

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
  # Rename static libraries
  rm "usr/lib/libjpeg.a"
  rm "usr/lib/libjpeg.so"
  rm "usr/lib/libjpeg.la"
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
