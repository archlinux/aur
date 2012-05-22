# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.28
pkgrel=4
pkgdesc="An AAC audio encoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2' 'glibc')
options=('!libtool')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'altivec.patch' 'mp4v2-1.9.patch' 'mp4v2-2.0.0.patch')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -p1 -i ../mp4v2-1.9.patch
  patch -p0 -i ../mp4v2-2.0.0.patch
  patch -p0 -i ../altivec.patch
  find . -type f -print0 | xargs -0 sed -i 's/\r//g'
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/libfaac/kiss_fft/COPYING \
    "${pkgdir}"/usr/share/licenses/faac/LICENSE
}
md5sums=('80763728d392c7d789cde25614c878f6'
         'e1ee422ab524fb1f78d178700c3a0e7f'
         '9d52a17e68fa15ca94e88e1457b94b74'
         '979ff4f13f36217cb15c92df9fd75f0c')
