# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>
# Contributor: Eric Le Bras <eric.lebras [at the] gmail [dot] com>
# Contributor: Jeroen Op 't Eynde <jeroen [at the] xprsyrslf [dot] be>

pkgname=('cnijfilter-common')
_pkgname=cnijfilter

pkgver=4.00
pkgrel=1
_pkgreview=1

pkgdesc="Canon IJ Printer Driver (Common Package)"
url="http://www.canon-europe.com/support/pixma_software/"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')

makedepends_x86_64=('gcc-multilib' 'lib32-popt')
depends_x86_64=('lib32-libcups' 'lib32-popt')

makedepends_i686=('gcc' 'popt')
depends_i686=('libcups' 'popt')

makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')

install=cnijfilter-common.install

# File size: 7786960 bytes
source=("cnijfilter-source-4.00-1.tar.gz::http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTUxNTAx&cmp=ACB&lang=EN"
	"cups.patch"
	"buildfiles.patch"
	"mychanges.patch")
sha512sums=('f90a5beec88812f65e8f52f287db8cefbb9c13eabbb7a1117c72d4af238126c282ebbca09ef96f3147d3bd5281f227402ae7564a68d32002eb033833a8080d72'
            'fe33272a243c164e574db591ccca09ef804c899d66ed2e2e3225cfaab503df016fb8f8c6da9e4989fcd8f38678884c989d87c02e47d95aafb60a776df158c7be'
            '9b1081c964c7894eefa8b4d11b04c7eafda208f629a373a09999fe8fe8f5ce85f6a697bb14e20a3b3ce795d578d46fde5a431b3f29eb4f0ee70e67477bf6f4c2'
            '4bd4d2854edfacb59e5b54b1eec348a982e25ba28608d1700e25efea9a54339be234ceaa9b6a013245d4135da14b34cd0d01ae91c315e63ff57565cd5ee1363f')

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
  if [ "${CARCH}" = 'x86_64' ]; then
    install -d ${pkgdir}/usr/lib
    ln -s /usr/lib32/bjlib ${pkgdir}/usr/lib/bjlib
  fi
  install -m 644 com/ini/cnnet.ini ${pkgdir}/usr/lib32/bjlib
  install -s -m 755 com/libs_bin32/lib*.so.* ${pkgdir}/usr/lib32
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  if [ "${CARCH}" = 'x86_64' ]; then
    mv ${pkgdir}/usr/lib/cups/backend ${pkgdir}/usr/lib32/cups/
    install -d ${pkgdir}/usr/lib/cups/backend
    ln -s /usr/lib32/cups/backend/* ${pkgdir}/usr/lib/cups/backend/
    install -d ${pkgdir}/usr/lib/cups/filter
    ln -s /usr/lib32/cups/filter/pstocanonij ${pkgdir}/usr/lib/cups/filter/
  fi

  install -d ${pkgdir}/etc/udev/rules.d
  install -m 644 etc/*.rules ${pkgdir}/etc/udev/rules.d
}
