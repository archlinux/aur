# Maintainer:  Andreas Baumann <mail@andreasbaumann.cc>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="mimetic"
_commit_rel="44b94873f8e6c4d1e1ea9b6c4ef8e1e50dbf3ff4" # 0.9.8
_commit="2be9506c9e00180b662461cc064305c82c220bf0" # r47
pkgver="0.9.8+r47+g${_commit::7}"
pkgrel=1
epoch=1
pkgdesc="A free, MIT licensed, Email library (MIME) written in C++"
arch=('x86_64' 'i686' 'riscv64')
url="https://www.codesink.org/mimetic_mime_library.html"
_url="https://github.com/tat/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_support_riscv.patch::${_url}/commit/6afbeab07a2ad6d9473b40ad81df37ee81452ae3.patch?full_index=1")
sha256sums=('dfab37789af34180fb1f7fffd24cedb20f14e6672bd5e89d31b00a2ccb6cc52a'
            '8fdfaee48aaf22682df6e7155b7e7f52fdc401b634986b69035be3c0f4cd21ff')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_support_riscv.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  # install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
