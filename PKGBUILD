# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>
# Contributor: Eric Le Bras <eric.lebras [at the] gmail [dot] com>
# Contributor: Jeroen Op 't Eynde <jeroen [at the] xprsyrslf [dot] be>

pkgname=('cnijfilter-common')
_pkgname=cnijfilter

pkgver=3.20
pkgrel=9
_pkgreview=1

pkgdesc="Canon IJ Printer Driver (Common Package)"
url="http://www.canon-europe.com/support/pixma_software/"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')
if [ "${CARCH}" = 'x86_64' ]; then
  makedepends=('gcc-multilib' 'lib32-popt')
  depends=('lib32-libcups' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
  makedepends=('gcc' 'popt')
  depends=('libcups' 'popt')
fi
makedepends+=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')

install=cnijfilter-common.install
  
# File size: 6552576 bytes
source=("http://files.canon-europe.com/files/soft37280/Software/IJ_Linux_Printer_Driver_Source_320.tar"
	"cups.patch"
	"mychanges.patch")
sha512sums=('28a82d08d3b8a233b89a17e0e029510fc5b3cede97300eb71a9af03c9a15cca4355167d8706e66c34eb47b6c98202a80d73f80626803c9ff6fa41bdd8c87f235'
            'f1f8cc44d7892eb50b44e0fe9d5be877fa5d8f8783aedf494d739eee20c147befac4f4776959f42cdb9cfd9f766522635fc2aae2626fdaf0c4465226a66dcc0e'
            '05eaef447a3145fe735ae856d86375144b368c378e86bf642db084a1f16eb474e0c1cf8df592620db76b6b99ff6dcd16b15c6c74f5ee9e00a3703c0bf104bf66')

prepare() {
  cd ${srcdir}
  tar xzf ${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  patch -p1 -i ${srcdir}/cups.patch

  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  export CC="gcc -m32"
  make common
}

package() {
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

