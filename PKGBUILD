# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <gordongr@freemail.gr>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=lib32-libshout
_pkgname=libshout
pkgver=2.4.3
pkgrel=1
pkgdesc="Library for accessing a shoutcast/icecast server (32 bit)"
arch=('x86_64')
depends=('lib32-libvorbis' 'lib32-libtheora' 'lib32-speex' 'lib32-openssl' 'libshout')
url="http://www.icecast.org/"
options=('!emptydirs')
license=('LGPL')
source=("https://downloads.xiph.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2623ebf5bdf00517d2a7fd17d70c31aa')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -e 's/SSLeay_add_all_algorithms/OpenSSL_add_all_algorithms/g' -i src/tls.c
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir"/usr/{include,share}
}
