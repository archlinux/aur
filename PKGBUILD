# Maintainer: Maxqia <public [at the] maxqia [dot] com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Stefan Hackl <stef.hackl [at the] gmail [dot] com>

pkgname=cnijfilter-mx920
_pkgname=cnijfilter

pkgver=3.90
pkgrel=3
_pkgreview=1

pkgdesc="Canon IJ printer driver (multifunction MX920 series)"
url="http://www.canon-europe.com/support/consumer_Products/products/fax__multifunctionals/inkjet/pixma_mx_series/mx925.aspx"

arch=('i686' 'x86_64')
license=('custom')

makedepends_x86_64=('gcc-multilib')
depends_x86_64=('lib32-gtk2')

makedepends_i686=('gcc')
depends_i686=('gtk2')

makedepends=('autoconf>=2.13' 'automake>=1.6')
depends=("${_pkgname}-common=4.10")

install=cnijfilter-mx920.install

source=("http://gdlp01.c-wss.com/gds/1/0100005171/01/cnijfilter-source-3.90-1.tar.gz"
	"cups.patch"
	"buildfiles.patch"
	"mychanges.patch")
sha512sums=('9ec303dc7209f5534a20e533fc18ec810603f4515655ce67f28f0f35d521185181351fd866d2191939eb02c783b168f637e18888a4e6a1eacc9e93b1b656ebcb'
            'da39232c83aff4ec09428ab0e2a167638c6912578c0bd119b8c15aa0d7e4412c18339cc3fd09a5ce76763338a92cd129548fa41ada842340e8ca0db6860eff42'
            'd827f8725e899cbeeae883141c55c3c1429797ceb3eaa2d11a1ab6602b4221e120f92fdee7d3ffc08cf99692332b73cb9e1da6b8d5631df3a8071dffbfde799e'
            '1cf54862db74f928a3a1ad0316b9940b843dbc4cae95bbb3d93ab317d248788cf844103bc006b4670c27b0f13952301b5907476a6c7d13ebb0cb5c0a942d6182')

prepare() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/buildfiles.patch
  patch -p1 -i ${srcdir}/mychanges.patch
}

build() {
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  # TODO: it looks like the libaries can also be built for 64 bit natively
  export CC="gcc -m32"
  # Required for the glib2
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  make mx920
}

package() {
  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  make PACKAGEDIR=${pkgdir} installmx920

  install -d ${pkgdir}/usr/lib32/bjlib
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 644 417/database/* ${pkgdir}/usr/lib32/bjlib/
  ln -rs ${pkgdir}/usr/lib32/bjlib/* ${pkgdir}/usr/lib/bjlib/
  install -s -m 755 417/libs_bin32/*.so.* ${pkgdir}/usr/lib32/

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

