# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>

pkgname=cnijfilter-mp550
_pkgname=cnijfilter

pkgver=3.20
pkgrel=14
_pkgreview=1

pkgdesc="Canon IJ Printer Driver (For Multifunction MP550 series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/PIXMA_MP550.aspx"

arch=('i686' 'x86_64')
license=('custom')

makedepends_x86_64=('gcc-multilib')
depends_x86_64=('lib32-gtk2')

makedepends_i686=('gcc')
depends_i686=('gtk2')

makedepends=('autoconf>=2.13' 'automake>=1.6')
depends=("${_pkgname}-common=4.10")

install=cnijfilter-mp550.install

source=("http://gdlp01.c-wss.com/gds/7/0100002367/01/cnijfilter-source-3.20-1.tar.gz"
	"id.patch"
	"cups.patch"
	"libpng15.patch"
	"mychanges.patch")
sha512sums=('3e6e5f3ed43e4054938387298a6d116828a0928568b3a165622c5a61abe9e39a30bc6d99a336317be228a794f0a2645b8f5453939695879f209b1a061b7d9164'
            'b75cdbdadac5fb396458dc9f14529c5e39a4fa47f97cd6a21a69b0dbac73f1b8dd90780068f6a348fcfb15939d0866dde1a1cf1ff7faaf0c443d2205a242ccd5'
            '747b17205a95197e8235959c691ee26b0c375ec8dae516416d16a9805c5b354c7019319d8be10c0c0230cfd8301ec5ddcd292bad245216d0a860cc2e6583c1fa'
            '0d8310867f45721150a870170172d3a0688bfba0267f627a630c105ff965d31f25dbcc31d3795874325bcb8eaeee395bf32b0648a743ff663dea6f977ab9070e'
            '807a2f726b5fb0f383118fc6c60449bd37f3a68f788a0ba2e3643f054f592fb886298c397b190280ef565cba2fe57f943abdbf86e8a4890172aaf716984cb70f')

prepare() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  patch -p1 -i ${srcdir}/id.patch
  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/libpng15.patch

  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  export CC="gcc -m32"
  # Required for the glib2
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  make mp550
}

package() {
  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  make PACKAGEDIR=${pkgdir} installmp550

  install -d ${pkgdir}/usr/lib32/bjlib
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 644 359/database/* ${pkgdir}/usr/lib32/bjlib/
  ln -rs ${pkgdir}/usr/lib32/bjlib/* ${pkgdir}/usr/lib/bjlib/
  install -s -m 755 359/libs_bin/*.so.* ${pkgdir}/usr/lib32/

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

