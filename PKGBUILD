# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_pkgbasename=libx11-threadsafe
pkgname=lib32-$_pkgbasename
pkgver=1.6.7
pkgrel=1
pkgdesc="X11 client-side library (32-bit) - threadsafe patches by Jacek Caban"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
depends=('lib32-libxcb' $_pkgbasename)
makedepends=('xorg-util-macros' 'xextproto' 'xtrans' 'inputproto' 'gcc-multilib')
provides=("lib32-libx11=${pkgver}")
conflicts=("lib32-libx11=${pkgver}")
license=('custom:XFREE86')
source=(${url}/releases/individual/lib/libX11-${pkgver}.tar.bz2{,.sig}
        threadsafe.patch)
sha256sums=('910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348'
            'SKIP'
            '1bbe923604ee12fd2b7d0a575b3a7212463c4ae558e5df1ac5f9646de3c5e5f5')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E')
validpgpkeys+=('C41C985FDCF1E5364576638B687393EE37D128F8') # Matthieu Herrb <matthieu.herrb@laas.fr>
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

prepare() {
  cd "libX11-${pkgver}"
  patch -Np1 <../threadsafe.patch
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "libX11-${pkgver}"
  ./configure --prefix=/usr --disable-static --disable-xf86bigfont \
      --libdir=/usr/lib32 --disable-specs
  make
}

check() {
  cd "libX11-${pkgver}"
  make check
}

package() {
  cd "libX11-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
