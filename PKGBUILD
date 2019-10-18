# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>
# Contributor: Eric Le Bras <eric.lebras [at the] gmail [dot] com>
# Contributor: Jeroen Op 't Eynde <jeroen [at the] xprsyrslf [dot] be>
# Contributor: Maxqia <contrib [at the] maxqia [dot] com

pkgname=('cnijfilter-common')
_pkgname=cnijfilter

pkgver=4.10
pkgrel=2
_pkgreview=1

pkgdesc="Canon IJ Printer Driver (Common Package)"
url="http://www.canon-europe.com/support/pixma_software/"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')

makedepends_x86_64=('gcc-multilib')
depends_x86_64=('lib32-libcups' 'lib32-popt' 'lib32-libusb' 'lib32-libxml2')

makedepends_i686=('gcc')
depends_i686=('libcups' 'popt' 'libusb' 'libxml2')

makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')

install=cnijfilter-common.install

# File size: 7683230 bytes
source=("cnijfilter-source-4.10-1.tar.gz::http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTg1ODAx&cmp=ACB&lang=EN"
	"cups.patch"
	"buildfiles.patch"
	"mychanges.patch")
sha512sums=('58198e92e360c71c95423bfa8278f449eb645245af1b96770323cb6f4b2b7186e5ab326d58377c20627c750d3d8c253addf637f9d18e085b1c89a81d6239ab51'
            'ce3de5764d47809166c86cc52feeae354f459bdc1db757ee62e8c7793b4886f95d9a04caee5adefc73b3ae1752ce370668d23d9530ebf8be2b7b25066e064210'
            'fb73e2e0653f2654a9c5211b5dc3e06ce24cd2f5bf64a27009f5446e69c7f02d78bb201f15da0f68ad01b1cb4e699c808eccb9df690ffea07b6d5a59ab5629f3'
            'c23d7e8406a7b43b0680a43cc1467075afc299b85ce5c3f7c0eb8e85f573226ec0dfb1497b70e0b08746cbc639360b746cd5962cfbf3935adb66aedf2a7fbcd2')

prepare() {
  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/"

  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/buildfiles.patch
  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/"

  export CC="gcc -m32"
  make common
}

package() {
  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/"
  
  make PACKAGEDIR=${pkgdir} installcommon
  
  install -d ${pkgdir}/usr/lib32/bjlib
  install -m 644 com/ini/cnnet.ini ${pkgdir}/usr/lib32/bjlib
  install -s -m 755 com/libs_bin32/lib*.so.* ${pkgdir}/usr/lib32
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  if [ "${CARCH}" = 'x86_64' ]; then
    install -d ${pkgdir}/usr/lib/bjlib
    ln -rs ${pkgdir}/usr/lib32/bjlib/* ${pkgdir}/usr/lib/bjlib/
    mv ${pkgdir}/usr/lib/cups/backend ${pkgdir}/usr/lib32/cups/
    install -d ${pkgdir}/usr/lib/cups/backend
    ln -rs ${pkgdir}/usr/lib32/cups/backend/* ${pkgdir}/usr/lib/cups/backend/
    install -d ${pkgdir}/usr/lib/cups/filter
    ln -s /usr/lib32/cups/filter/pstocanonij ${pkgdir}/usr/lib/cups/filter/
  fi

  install -d ${pkgdir}/etc/udev/rules.d
  install -m 644 etc/*.rules ${pkgdir}/etc/udev/rules.d
}
