# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=lib32-libpng12-git
pkgver=1.2.59
pkgrel=1
pkgdesc='A collection of routines used to create PNG format graphics files'
arch=('x86_64')
url='http://www.libpng.org/pub/png/libpng.html'
license=('custom')
depends=('lib32-glibc' 'lib32-zlib')
makedepends=('gcc-multilib')
provides=(lib32-libpng12)
conflicts=(lib32-libpng12)
source=(git://git.code.sf.net/p/libpng/code#branch=libpng12
        "https://sourceforge.net/projects/libpng-apng/files/libpng12/${pkgver}/libpng-${pkgver}-apng.patch.gz")
#validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F') # Glenn Randers-Pehrson
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd code
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd code

  patch -Np1 -i ../libpng-${pkgver}-apng.patch

  libtoolize --force --copy
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd code

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd code

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{libpng.{a,so},pkgconfig},share}

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/lib32-libpng12/
}

# vim: ts=2 sw=2 et:
