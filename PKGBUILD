# Maintainer: Evgeniy "arcanis" Alekseev <esalexeev@gmail.com>

pkgname=discover
pkgver=2.1.2
_dataver=2.2013.01.11
pkgrel=1
pkgdesc="Contains a library and front-end program for retrieving information about a system's hardware"
arch=('i686' 'x86_64')
url="http://svn.debian.org/wsvn/pkg-discover/"
license=('GPL')
depends=('curl' 'expat' 'check')
source=(http://ftp.de.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        http://ftp.de.debian.org/debian/pool/main/d/${pkgname}-data/${pkgname}-data_${_dataver}.tar.gz)
md5sums=('af78b63cc8db31b11d7e25958423611e'
         'dff223c271f3e9c52e7ba065c96c92ff')

build()
{
  if [[ -d ${srcdir}/build ]]; then
    rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"; cd "${srcdir}/build"
  ../${pkgname}-${pkgver}/configure --prefix="/usr" \
                                    --datadir="/usr/share" \
                                    --sysconfdir="/etc" \
                                    LIBS=-lcheck
  make
}

package()
{
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  # remove docs and sbin dir
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/sbin"
  
  # build data
  cd "${srcdir}/${pkgname}-data-${_dataver}"
  make prefix="/usr" DESTDIR="${pkgdir}" install
}
