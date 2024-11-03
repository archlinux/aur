# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>
# Contributor: Eric Le Bras <eric.lebras [at the] gmail [dot] com>
# Contributor: Jeroen Op 't Eynde <jeroen [at the] xprsyrslf [dot] be>
# Contributor: Maxqia <contrib [at the] maxqia [dot] com

pkgname=cnijfilter-common
_pkgname=cnijfilter
pkgver=4.10
pkgrel=6
_pkgreview=1
pkgdesc="Canon IJ Printer Driver (Common Package)"
url="https://www.canon-europe.com/support/pixma_software/"
arch=(x86_64 i686)
license=(LicenseRef-Canon_EULA)
conflicts=(lib32-cnijfilter320
           canon-pixma-mx920-complete)
depends_x86_64=(lib32-libcups lib32-popt lib32-libusb lib32-libxml2 lib32-glibc)
depends_i686=(libcups popt libusb libxml2)
install=cnijfilter-common.install
# File size: 7683230 bytes
source=("cnijfilter-source-4.10-1.tar.gz::http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwNTg1ODAx&cmp=ACB&lang=EN"
	    cups.patch
	    buildfiles.patch
	    mychanges.patch
        keytext.patch)
sha512sums=('58198e92e360c71c95423bfa8278f449eb645245af1b96770323cb6f4b2b7186e5ab326d58377c20627c750d3d8c253addf637f9d18e085b1c89a81d6239ab51'
            'ce3de5764d47809166c86cc52feeae354f459bdc1db757ee62e8c7793b4886f95d9a04caee5adefc73b3ae1752ce370668d23d9530ebf8be2b7b25066e064210'
            'fb73e2e0653f2654a9c5211b5dc3e06ce24cd2f5bf64a27009f5446e69c7f02d78bb201f15da0f68ad01b1cb4e699c808eccb9df690ffea07b6d5a59ab5629f3'
            '1c70fbe7da493cd44e13149baeda1d90edbbe0d9e52ca9178e70b8dc0e494f544523eefad653e2f2a4c0283f601feb549767f2eb2941cd44dc97ebc8b2b0db9a'
            'f2b02be6c520d6a8dde25ae8d674f2b0b74d17d5657769e17409830810257325ec1929d3581332353b1d562b12c22230fea30db85cc8aaf53cb8ae4bf74619e1')

prepare() {
  cd "${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/"
  patch -p1 -i ../cups.patch
  patch -p1 -i ../buildfiles.patch
  patch -p1 -i ../mychanges.patch
  patch -p1 -i ../keytext.patch
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
  install -m 644 com/ini/cnnet.ini "${pkgdir}"/usr/lib32/bjlib
  install -s -m 755 com/libs_bin32/lib*.so.* "${pkgdir}"/usr/lib32
  install -D "LICENSE-cnijfilter-${pkgver}EN.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  if [ "${CARCH}" = 'x86_64' ]; then
    install -d ${pkgdir}/usr/lib/bjlib
    ln -rs ${pkgdir}/usr/lib32/bjlib/* ${pkgdir}/usr/lib/bjlib/
    mv ${pkgdir}/usr/lib/cups/backend ${pkgdir}/usr/lib32/cups/
    install -d ${pkgdir}/usr/lib/cups/backend
    ln -rs ${pkgdir}/usr/lib32/cups/backend/* ${pkgdir}/usr/lib/cups/backend/
    install -d ${pkgdir}/usr/lib/cups/filter
    ln -s /usr/lib32/cups/filter/pstocanonij ${pkgdir}/usr/lib/cups/filter/
  fi

  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -m 644 etc/*.rules ${pkgdir}/usr/lib/udev/rules.d
}
