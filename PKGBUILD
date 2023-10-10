# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Endo Aya <endoaya@protonmail.ch>
# Contributor: Jan de Groot <jgc@archlinux.org>
_pkgbasename=libxpm
pkgname=lib32-$_pkgbasename
pkgver=3.5.17
pkgrel=1
pkgdesc="X11 pixmap library (32-bit)"
arch=(x86_64)
license=('custom')
url="https://xorg.freedesktop.org/"
depends=(lib32-libxt lib32-libxext lib32-gcc-libs ncompress $_pkgbasename)
makedepends=(xorg-util-macros gcc-multilib pkg-config)
options=('!libtool')
source=(${url}/releases/individual/lib/libXpm-${pkgver}.tar.xz{,.sig})
sha512sums=('52f9d2664a47a26c1a6ad65d18867de870b66947b0b0d99cca3512756a0aaa6ce2a245c0b49f20b70c3ce48bf04c47c333e8119a147465c277bca727f6ab017e'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/libXpm-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libXpm-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
