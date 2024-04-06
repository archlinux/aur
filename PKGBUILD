# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-pure

_pkgname=enchant
pkgver=2.6.9
pkgrel=1

pkgdesc="A wrapper library for pure (warning free) spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=('aspell>=0.50.0' 'glib2' 'hunspell')
provides=("${_pkgname}" "libenchant-2.so")
conflicts=("${_pkgname}")
source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7f3efec868445e8da95023a3c8b992893649eb263ba3811d87f4d293ab8af159818ad562714ed5bb584564fb61a2db55ea4c33872f2647ca86d0a20294e679bb')

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

