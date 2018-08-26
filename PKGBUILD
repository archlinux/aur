# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=ldns
pkgname=lib32-${_pkgname}
pkgver=1.7.0
pkgrel=1
pkgdesc='Fast DNS library supporting recent RFCs (32-bit)'
url='https://www.nlnetlabs.nl/projects/ldns/'
license=('custom:BSD')
arch=('x86_64')
depends=('lib32-openssl' 'ldns')
makedepends=('lib32-libpcap')
source=("https://www.nlnetlabs.nl/downloads/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'pc.patch')
sha256sums=('c19f5b1b4fb374cfe34f4845ea11b1e0551ddc67803bd6ddd5d2a20f0997a6cc'
            '3586302eed28269c7fa6013785c0a017689aa9d4ff24ff8d7735fa23a3732cb7')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/pc.patch"
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib32 \
    --localstatedir=/var \
    --disable-rpath \
    --with-drill \
    --without-examples

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
