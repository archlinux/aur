# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=lib32-libpciaccess-git
pkgver=0.16
pkgrel=1
pkgdesc="X11 PCI access library (32-bit"
arch=(x86_64)
license=('custom')
provides=('lib32-libpciaccess')
conflicts=('lib32-libpciaccess')
url="https://xorg.freedesktop.org/"
depends=('lib32-glibc' 'libpciaccess')
makedepends=('gcc-multilib' 'pkgconfig' 'xorg-util-macros')
source=(git+https://gitlab.freedesktop.org/xorg/lib/libpciaccess)
sha512sums=('SKIP')

pkgver() {
  cd libpciaccess
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libpciaccess

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
    --libdir=/usr/lib32
  make
}

package() {
  cd libpciaccess
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/include
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s libpciaccess "$pkgdir/usr/share/licenses/$pkgname"
}
