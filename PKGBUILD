# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc.archlinux.org>
# Contributor: Eric Johnson <eric.archlinux.org>

_origname=libidn
_suffix=11
pkgname=${_origname}${_suffix}
pkgver=1.34
pkgrel=1
pkgdesc="Provides final version of libidn.so.11"
url="https://www.gnu.org/software/libidn/"
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('glibc')
source=(https://ftp.gnu.org/gnu/${_origname}/${_origname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C'  # Simon Josefsson <simon@josefsson.org>
              '1CB27DBC98614B2D5841646D08302DB6A2670428') # Tim Rühsen <tim.ruehsen@gmx.de>
sha256sums=('3719e2975f2fb28605df3479c380af2cf4ab4e919e1506527e4c7670afff6e3c'
            'SKIP')

build() {
  cd ${_origname}-${pkgver}
  ./configure --prefix=/usr \
    --disable-static \
    --disable-doc \
    --program-suffix=${_suffix} \
    --includedir=/usr/include/${pkgname} \
    --datadir=/usr/share/${pkgname} \
    --localedir=/usr/share/${pkgname}/locale
  make
}

check() {
  cd ${_origname}-${pkgver}
  make check
}

package() {
  cd ${_origname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  # Move pkgconfig file
  mv "${pkgdir}"/usr/lib/pkgconfig/libidn{,${_suffix}}.pc
  # Delete no-version symlink
  rm "${pkgdir}"/usr/lib/*.so
}

