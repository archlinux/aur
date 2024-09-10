# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libdaap"
pkgver=0.0.4
pkgrel=1
pkgdesc="A C/C++ library to share digital audio between computers on a network"
arch=('x86_64')
url="https://${pkgname#lib}.sourceforge.net"
license=('LGPL-2.1-or-later')
depends=('gcc-libs' 'glibc')
provides=('libdaap.so')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/${pkgname#lib}/${_pkgsrc}.tar.gz"
        "${pkgname}_fix_cstring_includes.patch")
sha256sums=('5539c9a08a51aae946639144315d4d71d6c538fb881e9bae9bb541f140f4abda'
            '14b5c0270c1cdb466a6a7d92d1cbb173522ea6375ca82bcdc3b0a7d0b6cd1c84')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  ./configure \
    --prefix='/usr'
  make
}

ckeck() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make install DESTDIR="${pkgdir}" PREFIX='/usr'
  libtool --finish "${pkgdir}/usr/lib"

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS"
}
