# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=libxcb
pkgname=libx32-$_pkgbasename
pkgver=1.9
pkgrel=1.1
pkgdesc="X11 client-side library (x32 ABI)"
arch=(x86_64)
url="http://xcb.freedesktop.org/"
depends=('libx32-libxdmcp' 'libx32-libxau' $_pkgbasename)
makedepends=('pkgconfig' 'libx32-libxslt' 'binx32-python2' 'gcc-multilib-x32'
             'autoconf')
options=('!libtool')
license=('custom')
source=(${url}/dist/${_pkgbasename}-${pkgver}.tar.bz2
        libxcb-1.1-no-pthread-stubs.patch)
sha1sums=('ad2fb95eeec41ba3d39502a4f7460c3b64fdf061'
          'd2df03ddf3e949c10c2c185256b0eb7fa02837ab')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  patch -Np1 -i "${srcdir}/libxcb-1.1-no-pthread-stubs.patch"

  export CC="gcc -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  PYTHON=/usr/bin/python2-x32 ./autogen.sh \
	  --prefix=/usr \
	  --enable-xinput \
	  --libdir=/usr/libx32 \
	  --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname" 
}
