# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=enchant-pure

_pkgname=enchant
pkgver=2.6.4
pkgrel=1

pkgdesc="A wrapper library for pure (warning free) spell checking for all languages, supporting Aspell and Myspell/Hunspell backend engines"
url="https://github.com/AbiWord/enchant"

arch=('x86_64')
license=('LGPL')

depends=('aspell>=0.50.0' 'glib2' 'hunspell')
provides=("${_pkgname}" "libenchant-2.so")
conflicts=("${_pkgname}")
source=("https://github.com/AbiWord/enchant/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('56d683000f91817638ccbc902aaf29ce147e46236974e8049fbf71f8a984597b6941bc373c4e19e50dc7b07fb341df3be5508ef9d59ad96f2e00ecb556b47eae')

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

