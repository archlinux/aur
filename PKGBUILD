# $Id$
# Maintainer: Alfonso Saavedra "son Link" <sonlink.dourden@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: jlvsimoes <jlvsimoes@oninet.pt>

pkgname=crypto++-562
pkgver=5.6.2
_srcver=562
pkgrel=3
pkgdesc="A free C++ class library of cryptographic schemes"
arch=('i686' 'x86_64')
url="http://www.cryptopp.com/"
license=('custom')
depends=('gcc-libs')
conflicts=('crypto++')
makedepends=('unzip')
source=("http://www.cryptopp.com/cryptopp${_srcver}.zip"
	'CVE-2015-2141.patch'
        'libcrypto++.pc')
md5sums=('7ed022585698df48e65ce9218f6c6a67'
         '7ff9a215b9244b4f8a17c7185e27beda'
         '46de3847c59ad16456fa863eb33e73b2')

prepare() {
  patch -p1 -i ${srcdir}/CVE-2015-2141.patch
}

build() {
  sed -i -e 's/^CXXFLAGS/#CXXFLAGS/' GNUmakefile
  export CXXFLAGS="${CXXFLAGS} -DNDEBUG -fPIC"
  make -f GNUmakefile  
  make libcryptopp.so
}

package() {
  install -d ${pkgdir}/usr/{lib/pkgconfig,include/cryptopp}
  install -m644 *.h ${pkgdir}/usr/include/cryptopp/
  install -m644 libcryptopp.so "${pkgdir}/usr/lib/libcryptopp.so"
  install -m644 ${srcdir}/libcrypto++.pc "${pkgdir}/usr/lib/pkgconfig/libcrypto++.pc"
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
