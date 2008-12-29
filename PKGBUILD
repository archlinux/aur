# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=faac
pkgver=1.26
pkgrel=2
pkgdesc="FAAC is an AAC audio encoder."
arch=(i686 x86_64)
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2' 'glibc')
makedepends=('automake' 'autoconf' 'libtool')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz libmp4v2.patch)

build() {
  cd ${startdir}/src/${pkgname}
  patch -Np1 -i ${startdir}/src/libmp4v2.patch || return 1
  find . -type f -print0 | xargs -0 sed -i 's/\r//g'
  ./bootstrap
  ./configure --prefix=/usr --with-mp4v2
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m644 ${startdir}/src/${pkgname}/libfaac/kiss_fft/COPYING \
                   ${startdir}/pkg/usr/share/licenses/faac/COPYING.kiss_fft
}
md5sums=('1d7c019bd2dbb4f3101b8937ebc59cf6' '166d1415eb7f908d55118c467e800110')
