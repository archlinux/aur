# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-pure

_pkgname=enchant
pkgver=2.3.2
pkgrel=1

pkgdesc="A wrapper library for pure and generic spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=('aspell>=0.50.0' 'glib2' 'hunspell')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('886635bb55c5f0c774445e4a0f14d39e2d08eeb964257037062c2e97c2cf3348be8c631ff5e7a13144936127761964bdc60ff1e0dd6f63b292a655626f91ef62')

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

