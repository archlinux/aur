# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=lib32-rrdtool
_pkgname=rrdtool
pkgver=1.8.0
pkgrel=1
pkgdesc="Data logging and graphing application (32-bit - binaries and libs only)"
arch=('x86_64')
url="http://www.rrdtool.org"
license=('GPL' 'custom')
depends=('lib32-glibc' 'lib32-libxml2' 'lib32-pango' 'ttf-dejavu')
makedepends=('intltool')
options=('!emptydirs' '!makeflags')
source=(https://github.com/oetiker/rrdtool-1.x/releases/download/v${pkgver}/rrdtool-${pkgver}.tar.gz)
sha1sums=('4da6da5e2f789d006c1ccc3b816a5a1ac9123bc8')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's%etc/%%' etc/Makefile.am
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  aclocal
  automake
}

build() {
  cd ${_pkgname}-${pkgver}
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --localstatedir=/var --disable-rpath \
    --disable-perl --disable-perl-site-install \
    --disable-ruby --disable-ruby-site-install --disable-python \
    --disable-lua --disable-lua-site-install --disable-tcl --disable-libwrap \
    --disable-examples --libdir=/usr/lib32 --disable-docs --disable-nls --disable-librados \
    --disable-rrdcached
  make LIBS+="-lglib-2.0"
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install-exec
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.32bit"
  for bin in "${pkgdir}"/usr/bin/*
  do
    mv "${bin}" "${bin}_32"
  done
}
