# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>

pkgbase=('cnijfilter-mp550')

pkgname=('cnijfilter-mp550')
true && pkgname=('cnijfilter-common' 'cnijfilter-mp550')
_pkgname=cnijfilter

pkgver=3.20
pkgrel=8
_pkgreview=1

pkgdesc="Canon Printer Driver (For Multifunction MP550 series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/PIXMA_MP550.aspx"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')
if [ "${CARCH}" = 'x86_64' ]; then
  makedepends=('gcc-multilib' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
  makedepends=('gcc' 'popt')
fi
makedepends+=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')


# File size: 6552576 bytes
source=("http://files.canon-europe.com/files/soft37280/Software/IJ_Linux_Printer_Driver_Source_320.tar"
	"id.patch"
	"cups.patch"
	"libpng15.patch"
	"mychanges.patch")
sha512sums=('28a82d08d3b8a233b89a17e0e029510fc5b3cede97300eb71a9af03c9a15cca4355167d8706e66c34eb47b6c98202a80d73f80626803c9ff6fa41bdd8c87f235'
            'b75cdbdadac5fb396458dc9f14529c5e39a4fa47f97cd6a21a69b0dbac73f1b8dd90780068f6a348fcfb15939d0866dde1a1cf1ff7faaf0c443d2205a242ccd5'
            'f1f8cc44d7892eb50b44e0fe9d5be877fa5d8f8783aedf494d739eee20c147befac4f4776959f42cdb9cfd9f766522635fc2aae2626fdaf0c4465226a66dcc0e'
            '0d8310867f45721150a870170172d3a0688bfba0267f627a630c105ff965d31f25dbcc31d3795874325bcb8eaeee395bf32b0648a743ff663dea6f977ab9070e'
            '0e9dd821289f34da20e7d978583edeccde2cbfca8f0f78273bd2f4de63f7eab4e017d5c60395bc229fceea85c64c916e04be9b227b9af018b9d387e26a5a2b99')

prepare() {
  cd ${srcdir}
  tar xzf ${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  patch -p1 -i ${srcdir}/id.patch
  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/libpng15.patch

  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  export CC="gcc -m32"
  make mp550
}

package_cnijfilter-common() {
  pkgdesc="Canon IJ Printer Driver - Common files (32-bit)"
  install=cnijfilter-common.install
  
  if [ "${CARCH}" = 'x86_64' ]; then
    depends=('lib32-libcups' 'lib32-popt')
  elif [ "${CARCH}" = 'i686' ]; then
    depends=('libcups' 'popt')
  fi

  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}
  
  make PACKAGEDIR=${pkgdir} installcommon
  
  install -d ${pkgdir}/usr/lib32/bjlib
  if [ "${CARCH}" = 'x86_64' ]; then
    install -d ${pkgdir}/usr/lib
    ln -s /usr/lib32/bjlib ${pkgdir}/usr/lib/bjlib
  fi
  
  install -m 644 com/ini/cnnet.ini ${pkgdir}/usr/lib32/bjlib
  install -s -m 755 com/libs_bin/libcnnet.so.1.1.0 ${pkgdir}/usr/lib32

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  
  if [ "${CARCH}" = 'x86_64' ]; then
    mv ${pkgdir}/usr/lib/cups/backend ${pkgdir}/usr/lib32/cups/
    install -d ${pkgdir}/usr/lib/cups/backend
    ln -s /usr/lib32/cups/backend/cnijnet ${pkgdir}/usr/lib/cups/backend/
    ln -s /usr/lib32/cups/backend/cnijusb ${pkgdir}/usr/lib/cups/backend/
    install -d ${pkgdir}/usr/lib/cups/filter
    ln -s /usr/lib32/cups/filter/pstocanonij ${pkgdir}/usr/lib/cups/filter/
  fi
}

package_cnijfilter-mp550() {
  pkgdesc="Canon IJ Printer Driver (For Multifunction MP550 series)"
  install=cnijfilter-mp550.install

  if [ "${CARCH}" = 'x86_64' ]; then
    depends=('lib32-gtk2' 'lib32-libxml2' "${_pkgname}-common=${pkgver}")
  elif [ "${CARCH}" = 'i686' ]; then
    depends=('gtk2' 'libxml2' "${_pkgname}-common=${pkgver}")
  fi

  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  make PACKAGEDIR=${pkgdir} installmp550

  install -d ${pkgdir}/usr/lib32/bjlib
  install -m 644 359/database/* ${pkgdir}/usr/lib32/bjlib/
  install -s -m 755 359/libs_bin/*.so.* ${pkgdir}/usr/lib32/

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

