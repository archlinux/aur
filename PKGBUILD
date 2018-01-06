# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=normalize
pkgver=0.7.7
pkgrel=7
pkgdesc="A tool for adjusting the volume of WAV files to a standard level"
arch=('x86_64')
url="http://normalize.nongnu.org"
license=('GPL')
depends=('audiofile' 'libmad' 'vorbis-tools' 'lame' 'flac' 'mpg123')
makedepends=('pkg-config' 'intltool')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'normalize-0.7.7-audiofile-pkgconfig.patch'
        'normalize-0.7.7-m4.patch')
md5sums=('1749b16fc7a08aa5d0cf9f76eeaa8436'
         '77d565e29bef11837e80347adfd42b58'
         '0b4bca7bf183275b9f939576ebad4233')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/normalize-0.7.7-audiofile-pkgconfig.patch"
  patch -Np0 -i "${srcdir}/normalize-0.7.7-m4.patch"

  touch AUTHORS NEWS ChangeLog
  #libtoolize --force --copy
  #aclocal -I m4
  autoreconf -vi
  #automake --add-missing
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --with-audiofile \
              --with-mad
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
