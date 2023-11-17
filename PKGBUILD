# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-pure

_pkgname=enchant
pkgver=2.6.2
pkgrel=2

pkgdesc="A wrapper library for pure (warning free) spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=('aspell>=0.50.0' 'glib2' 'hunspell')
provides=("${_pkgname}" "libenchant-2.so")
conflicts=("${_pkgname}")
source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4f830cd19ca5a3ddcc8e2fff651ed1d8fba27f412b45f35f80a5ada54d0203081ca6cc8fd764dde5d6c4a8a9677cb5bf61f0b77bf06ba18bc09e51914c869bcd')

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

