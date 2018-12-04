# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

pkgname=libx11-threadsafe
pkgver=1.6.7
pkgrel=1
pkgdesc="X11 client-side library"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
depends=('libxcb' 'xproto' 'kbproto')
makedepends=('xorg-util-macros' 'xextproto' 'xtrans' 'inputproto')
provides=("libx11=${pkgver}")
conflicts=("libx11=${pkgver}")
license=('custom')
source=(${url}/releases/individual/lib/libX11-${pkgver}.tar.bz2{,.sig}
        threadsafe.patch)
sha256sums=('910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348'
            'SKIP'
            '1bbe923604ee12fd2b7d0a575b3a7212463c4ae558e5df1ac5f9646de3c5e5f5')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E')
validpgpkeys+=('C41C985FDCF1E5364576638B687393EE37D128F8') # Matthieu Herrb <matthieu.herrb@laas.fr>
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

prepare() {
  cd 'libX11-1.6.7'
  patch -Np1 <../threadsafe.patch
}

build() {
  cd "${srcdir}/libX11-${pkgver}"
  ./configure --prefix=/usr --disable-static --disable-xf86bigfont
  make
}

check() {
  cd "${srcdir}/libX11-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/libX11-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
