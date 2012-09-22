# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>
_pkgbasename=fontconfig
pkgname=libx32-$_pkgbasename
pkgver=2.10.1
pkgrel=1.1
pkgdesc="A library for configuring and customizing font access (x32 ABI)"
arch=(x86_64)
url="http://www.fontconfig.org/release/"
license=('custom')
depends=('libx32-expat>=2.0.1' 'libx32-freetype2>=2.3.11' $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool')
source=(http://www.fontconfig.org/release/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('c94e380eea42f2f23ca9537035ef1899')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  # make sure there's no rpath trouble and sane .so versioning - FC and Gentoo do this as well
  libtoolize -f
  autoreconf -f

  ./configure --prefix=/usr \
	  --sysconfdir=/etc \
	  --with-templatedir=/etc/fonts/conf.avail \
	  --with-xmldir=/etc/fonts \
	  --localstatedir=/var \
	  --disable-static \
	  --with-default-fonts=/usr/share/fonts \
	  --with-add-fonts=/usr/share/fonts \
	  --libdir=/usr/libx32

  make
}

check() {
	cd "$srcdir/$_pkgbasename-$pkgver"
	make -k check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin} "$pkgdir"/{etc,var}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
