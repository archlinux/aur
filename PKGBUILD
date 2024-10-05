# Maintainer:  Andreas Baumann <mail@andreasbaumann.cc>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname="mimetic"
pkgver=0.9.8+r47+2be9506
_commit_rel="44b94873f8e6c4d1e1ea9b6c4ef8e1e50dbf3ff4" # 0.9.8
_commit="2be9506c9e00180b662461cc064305c82c220bf0"
pkgrel=1
pkgdesc="A free, MIT licensed, Email library (MIME) written in C++"
arch=('x86_64' 'i686' 'riscv64')
url="https://www.codesink.org/mimetic_mime_library.html"
_url="https://github.com/tat/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgname}_support_riscv.patch::${_url}/commit/6afbeab07a2ad6d9473b40ad81df37ee81452ae3.patch")
sha256sums=('dfab37789af34180fb1f7fffd24cedb20f14e6672bd5e89d31b00a2ccb6cc52a'
            '7cfb2781be9fbf511b632f9f317c98ccfd88b2d660d5a5e245e1238db4bc22b6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
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

  # install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
