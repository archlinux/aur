# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>

pkgname=('cnijfilter-mx920')
_pkgname=cnijfilter

pkgver=3.90
pkgrel=1
_pkgreview=1

pkgdesc="Canon IJ printer driver (multifunction MX920 series)"
url="http://www.canon-europe.com/support/consumer_Products/products/fax__multifunctionals/inkjet/pixma_mx_series/mx925.aspx"

arch=('i686' 'x86_64')
license=('custom')

makedepends_x86_64=('gcc-multilib' 'lib32-popt')
depends_x86_64=('lib32-gtk2' 'lib32-libxml2')

makedepends_i686=('gcc' 'popt')
depends_i686=('gtk2' 'libxml2')

makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make')
depends=("${_pkgname}-common=4.00")

install=cnijfilter-mx920.install

source=("http://gdlp01.c-wss.com/gds/1/0100005171/01/cnijfilter-source-3.90-1.tar.gz"
	"cups.patch"
	"buildfiles.patch"
	"mychanges.patch")
sha512sums=('9ec303dc7209f5534a20e533fc18ec810603f4515655ce67f28f0f35d521185181351fd866d2191939eb02c783b168f637e18888a4e6a1eacc9e93b1b656ebcb'
            'b46027090fc03f1b6503b4532881dfb49bf69eff342d4eedca6ed8e39f896de0ff8f8c5ae3dc8e9b5645a3dd1029390668a48737ce01d58d1b01b899fad56b4c'
            'd827f8725e899cbeeae883141c55c3c1429797ceb3eaa2d11a1ab6602b4221e120f92fdee7d3ffc08cf99692332b73cb9e1da6b8d5631df3a8071dffbfde799e'
            '1cf54862db74f928a3a1ad0316b9940b843dbc4cae95bbb3d93ab317d248788cf844103bc006b4670c27b0f13952301b5907476a6c7d13ebb0cb5c0a942d6182')

prepare() {
  cd ${srcdir}
  tar xzf ${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/buildfiles.patch
  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  # TODO: it looks like the libaries can also be built for 64 bit natively
  export CC="gcc -m32"
  make mx920
}

package() {
  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  make PACKAGEDIR=${pkgdir} installmx920

  install -d ${pkgdir}/usr/lib32/bjlib
  install -m 644 417/database/* ${pkgdir}/usr/lib32/bjlib/
  install -s -m 755 417/libs_bin32/*.so.* ${pkgdir}/usr/lib32/

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

