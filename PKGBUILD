# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libxcb-git
pkgver=1.14
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://xcb.freedesktop.org/"
depends=('lib32-libxdmcp' 'lib32-libxau' 'libxcb')
makedepends=('pkgconfig' 'libxslt' 'python' 'xorg-util-macros' 'gcc-multilib'
             'autoconf' 'xorgproto')
provides=(lib32-libxcb)
conflicts=(lib32-libxcb)
license=('custom')
source=("git+https://gitlab.freedesktop.org/xorg/lib/libxcb")
sha512sums=('SKIP')

pkgver() {
  cd libxcb
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libxcb

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  # workaround for FS#49560
  export CFLAGS="${CFLAGS} -O1"

  ./autogen.sh \
	  --prefix=/usr \
	  --enable-xinput \
          --enable-xkb \
	  --libdir=/usr/lib32 \
	  --without-doxygen \
	  --disable-static
  make
}

package() {
  cd libxcb

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s libxcb "$pkgdir/usr/share/licenses/lib32-libxcb"
}
