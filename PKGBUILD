# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# COntributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgbase="gdlmm"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=3.7.3
pkgrel=6
pkgdesc="C++ bindings for the gdl library"
arch=('x86_64')
url="https://gitlab.gnome.org/Archive/gdlmm"
license=('LGPL-2.0-or-later')
makedepends=('atkmm' 'gcc-libs' 'gdl>=3.7' 'glib2' 'glibc' 'glibmm>=2.16'
             'gtk3' 'gtkmm3' 'libsigc++' 'mm-common')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('e280ed9233877b63ad0a0c8fb04d2c35dc6a29b3312151ee21a15b5932fef79b')

build() {
  CXXFLAGS+=' -std=c++11'

  cd "${srcdir}/${_pkgsrc}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix='/usr'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package_gdlmm() {
  depends=('atkmm' 'gcc-libs' 'gdl>=3.7' 'glib2' 'glibc' 'glibmm>=2.16' 'gtk3'
           'gtkmm3' 'libsigc++')
  provides=("lib${pkgbase}-3.0.so")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share"

  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgbase}/AUTHORS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

package_gdlmm-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/doc"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
