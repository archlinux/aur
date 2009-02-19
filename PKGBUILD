# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=faac
pkgver=1.28
pkgrel=1
pkgdesc="FAAC is an AAC audio encoder."
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2' 'glibc')
makedepends=('automake' 'autoconf' 'libtool')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz libmp4v2.patch)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/libmp4v2.patch || return 1
  find . -type f -print0 | xargs -0 sed -i 's/\r//g'
  ./bootstrap
  ./configure --prefix=/usr --with-mp4v2
  make || return 1
  make DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/libfaac/kiss_fft/COPYING \
                   ${pkgdir}/usr/share/licenses/faac/COPYING.kiss_fft
}
md5sums=('80763728d392c7d789cde25614c878f6'
         'cce9b24cecc90d9b157adbf94176a454')
