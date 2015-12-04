# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=libjpeg-turbo-java
_srcname=libjpeg-turbo
pkgver=1.4.2
pkgrel=1
pkgdesc='JPEG image codec with accelerated baseline compression and decompression'
url='http://libjpeg-turbo.virtualgl.org/'
arch=('i686' 'x86_64')
license=('custom')
makedepends=('nasm' 'java-runtime')
source=("http://downloads.sourceforge.net/project/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.gz")
sha1sums=('2666158ccd5318513f875867bbc4af52f6eb9f0b')
provides=('libjpeg=8.0.2' 'turbojpeg' 'libjpeg-turbo')
conflicts=('libjpeg' 'turbojpeg' 'libjpeg-turbo')
replaces=('libjpeg' 'turbojpeg' 'libjpeg-turbo')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  INCLUDES="-I/usr/lib/jvm/default/include -I/usr/lib/jvm/default/include/linux"
  export CFLAGS="${CFLAGS} ${INCLUDES}"

  autoreconf -fiv
  ./configure --prefix=/usr --with-java --with-jpeg8 --mandir=/usr/share/man
  make -j1
}

check() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make \
    DESTDIR="${pkgdir}" \
    docdir="/usr/share/doc/${_srcname}" \
    exampledir="/usr/share/doc/${_srcname}" \
    install

  install -d "${pkgdir}/usr/share/licenses/libjpeg-turbo"
  ln -t "${pkgdir}/usr/share/licenses/libjpeg-turbo" -s ../../doc/libjpeg-turbo/README{,-turbo.txt}
  install -m644 jpegint.h "${pkgdir}/usr/include" # required by other software
}
