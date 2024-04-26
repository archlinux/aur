# Maintainer: 
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Brian Bidulock < bidulock AT openss7 DOT org >
# Contributor: Tobias Kieslich <neri@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=lcms
pkgver=1.19
pkgrel=9
pkgdesc='Lightweight color management library (legacy version 1)'
arch=('x86_64' 'i686')
url='https://www.littlecms.com'
license=('MIT')
depends=(
  'glibc'
  'libjpeg'
  'libtiff'
)
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'cve-2013-4276.patch')
b2sums=('b8850f47652270082e11729119c35dfb90e112a40a80c531298b9585d89b3fba6e3ff1e0abd284ec2c6654a64fd44870f79d0a437917b8414e94d38afb66be93'
        '35d54f9e23612cd9117a7db4adb2fa111036257582fc46ab0d6e687561783bcbbf415ae0ebc1c83ebe07e3ba42340ba56a2d42deb123473f79d7832775a07469')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../cve-2013-4276.patch

  echo "Adding LDFLAGS vaues to CLFLAGS to respect LTO, relro, as-needed etc. configs."
  export CFLAGS+=" ${LDFLAGS}"

  ./configure \
    --prefix=/usr \
    --without-python
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m0644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
