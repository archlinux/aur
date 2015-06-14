# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>

pkgbase=('cnijfilter-mp550')

pkgname=('cnijfilter-mp550')
true && pkgname=('cnijfilter-common' 'cnijfilter-mp550')
_pkgname=cnijfilter

pkgver=3.20
pkgrel=7
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
sha1sums=('4d4307845331ab9f0f4ea2ea3b9d1256f2beb91e'
          '1275088852e2c2a6840358ed49658c084f965630'
          'bb9d063ff971dc134bf92557070555fd2607e01f'
          'ab4a736d6dfabed6d7e4386497261bd7bf9b6108'
          '0e1c4ff15b4847e5d3168928b3ac3f2fa1353bfe')
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

