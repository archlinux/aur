# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=lib32-libpng12
pkgver=1.2.56
pkgrel=4
pkgdesc='A collection of routines used to create PNG format graphics files'
arch=('x86_64')
url='https://www.libpng.org/pub/png/libpng.html'
license=('custom')
depends=('lib32-glibc' 'lib32-zlib')
makedepends=('gcc-multilib')
source=("https://sourceforge.net/projects/libpng/files/libpng-${pkgver}.tar.xz"{,.asc}
        "https://sourceforge.net/projects/apng/files/libpng/libpng12/libpng-${pkgver}-apng.patch.gz")
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F') # Glenn Randers-Pehrson
sha256sums=('24ce54581468b937734a6ecc86f7e121bc46a90d76a0d948dca08f32ee000dbe'
            '454631947201483930c759ecb3741618258e8143db4ff13b0d938b4238bc8708')

prepare() {
  cd libpng-${pkgver}

  patch -Np0 -i ../libpng-${pkgver}-apng.patch

  libtoolize --force --copy
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd libpng-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd libpng-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{libpng.{a,so},pkgconfig},share}

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/lib32-libpng12/
}

# vim: ts=2 sw=2 et:
