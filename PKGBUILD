# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libdaap"
pkgver=0.0.4
pkgrel=2
pkgdesc="A C/C++ library to share digital audio between computers on a network"
arch=(
  'x86_64'
)
url="https://daap.sourceforge.net"
license=(
  'LGPL-2.1-or-later'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
provides=(
  "${pkgname}.so"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://downloads.sourceforge.net/sourceforge/daap/${_pkgsrc}.tar.gz"
  "${pkgname}_include_cstring.patch"
)
md5sums=('9450cbd3e9c52de3d85f976e43e22a97'
         '21ae86a4f813f62ce41bc23479425e0a')
sha1sums=('ec73f2a734714e219d14a7027e65d55fec38d4d5'
          'a4e40efe963efbeb101bbecb6074bc49b4643260')
sha256sums=('5539c9a08a51aae946639144315d4d71d6c538fb881e9bae9bb541f140f4abda'
            '14b5c0270c1cdb466a6a7d92d1cbb173522ea6375ca82bcdc3b0a7d0b6cd1c84')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_include_cstring.patch"
}

build() {
  local configure_options=(
    --prefix='/usr'
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

ckeck() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make install DESTDIR="${pkgdir}" PREFIX='/usr'

  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
