# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-pure

_pkgname=enchant
pkgver=2.2.9
pkgrel=1

pkgdesc="A wrapper library for pure and generic spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=('aspell>=0.50.0' 'glib2' 'hunspell')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('cfed111cd4a0b01cc2001ae668548cd7dcb0772282d86540db2b1a400edc9f300fcf39b3a65b11e04ebcb727ba5c37e2bedfbfaa84ae512660bd5099c0eb2498')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-static=no --with-aspell=yes --with-hunspell=yes --with-voikko=no --with-hspell=no --with-zemberek=no --with-applespell=no
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # installing some symlinks for compatibility with enchant-1
  ln -s "enchant-2" "${pkgdir}/usr/bin/enchant"
  ln -s "enchant-lsmod-2" "${pkgdir}/usr/bin/enchant-lsmod"
  ln -s "enchant-2" "${pkgdir}/usr/include/enchant"
  ln -s "enchant-2" "${pkgdir}/usr/lib/enchant"
  ln -s "libenchant-2.so.${pkgver}" "${pkgdir}/usr/lib/libenchant.so.${pkgver}"
  ln -s "libenchant-2.so.${pkgver}" "${pkgdir}/usr/lib/libenchant.so.2"
  ln -s "libenchant-2.so.${pkgver}" "${pkgdir}/usr/lib/libenchant.so"
}

