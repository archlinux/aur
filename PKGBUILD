# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>

pkgname=('cnijfilter-mp550')
_pkgname=cnijfilter

pkgver=3.20
pkgrel=11
_pkgreview=1

pkgdesc="Canon IJ Printer Driver (For Multifunction MP550 series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/PIXMA_MP550.aspx"

arch=('i686' 'x86_64')
license=('custom')

makedepends_x86_64=('gcc-multilib' 'lib32-popt')
depends_x86_64=('lib32-gtk2' 'lib32-libxml2')

makedepends_i686=('gcc' 'popt')
depends_i686=('gtk2' 'libxml2')

makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')
depends=("${_pkgname}-common=4.00")

install=cnijfilter-mp550.install

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
            '807a2f726b5fb0f383118fc6c60449bd37f3a68f788a0ba2e3643f054f592fb886298c397b190280ef565cba2fe57f943abdbf86e8a4890172aaf716984cb70f')

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

package() {
  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  make PACKAGEDIR=${pkgdir} installmp550

  install -d ${pkgdir}/usr/lib32/bjlib
  install -m 644 359/database/* ${pkgdir}/usr/lib32/bjlib/
  install -s -m 755 359/libs_bin/*.so.* ${pkgdir}/usr/lib32/

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

