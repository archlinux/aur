# Maintainer: Roman Beslik <me@beroal.in.ua>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('cnijfilter-e510')
_pkgname=cnijfilter
_model=e510
_model_dir=403

pkgver=3.80
pkgrel=1
_pkgreview=2

pkgdesc="Canon IJ Printer Driver (For PIXMA E510 series)"
url="https://www.canon-europe.com/support/consumer_products/products/printers/inkjet/other_pixma/pixma_e514.aspx"

arch=('i686' 'x86_64')
license=('custom')

makedepends_x86_64=('gcc-multilib' 'lib32-popt')
depends_x86_64=('lib32-gtk2' 'lib32-libxml2')

makedepends_i686=('gcc' 'popt')
depends_i686=('gtk2' 'libxml2')

makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')
depends=("${_pkgname}-common=4.00")

install=cnijfilter-${_model}.install

source=("http://gdlp01.c-wss.com/gds/6/0100005266/01/${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz"
	"libpng15.patch"
	"cups.patch"
	"buildfiles.patch"
	"mychanges.patch")
sha512sums=('693dad98b8e69bb4bbad3c62a600b0be5073e8765756cd57722038089387ffe532d01daf5a74d3a8aa93fdc14f7de0326b8aa67acce24d105b0dcb25dfd94be5'
            '0d8310867f45721150a870170172d3a0688bfba0267f627a630c105ff965d31f25dbcc31d3795874325bcb8eaeee395bf32b0648a743ff663dea6f977ab9070e'
            'b46027090fc03f1b6503b4532881dfb49bf69eff342d4eedca6ed8e39f896de0ff8f8c5ae3dc8e9b5645a3dd1029390668a48737ce01d58d1b01b899fad56b4c'
            'c4f36bce601cfc7a88933c480843c945daf0ae71dd07cf261bcd46017b350b9f870c8df5461ee82222e495a118d671b54b510ae42476fc89c38610b2a7c80d8c'
            '1cf54862db74f928a3a1ad0316b9940b843dbc4cae95bbb3d93ab317d248788cf844103bc006b4670c27b0f13952301b5907476a6c7d13ebb0cb5c0a942d6182')

prepare() {
  cd ${srcdir}
  tar xzf ${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  patch -p1 -i ${srcdir}/libpng15.patch
  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/buildfiles.patch
  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  export CC="gcc -m32"
  make ${_model}
}

package() {
  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  make PACKAGEDIR=${pkgdir} install${_model}

  install -d ${pkgdir}/usr/lib32/bjlib
  install -m 644 ${_model_dir}/database/* ${pkgdir}/usr/lib32/bjlib/
  install -s -m 755 ${_model_dir}/libs_bin32/*.so.* ${pkgdir}/usr/lib32/

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}
