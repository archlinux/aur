# Maintainer:
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.28
pkgrel=2
pkgdesc="An AAC audio encoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2' 'glibc')
makedepends=('automake' 'autoconf' 'libtool')
options=('!libtool')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'mp4v2-1.9.patch')
md5sums=('80763728d392c7d789cde25614c878f6'
         '9d52a17e68fa15ca94e88e1457b94b74')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/mp4v2-1.9.patch
  find . -type f -print0 | xargs -0 sed -i 's/\r//g'
  ./bootstrap
  ./configure --prefix=/usr --with-mp4v2
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/libfaac/kiss_fft/COPYING \
    "${pkgdir}"/usr/share/licenses/faac/LICENSE
}
