# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc.archlinux.org>
# Contributor: Eric Johnson <eric.archlinux.org>

pkgname=lib32-libidn11
pkgver=1.33
pkgrel=2
pkgdesc='Implementation of the Stringprep, Punycode and IDNA specifications'
url='https://www.gnu.org/software/libidn/'
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('lib32-glibc')
makedepends=('git' 'gperf' 'gtk-doc')
source=("git+https://git.savannah.gnu.org/git/libidn.git?signed#tag=libidn-${pkgver//./-}"
        'libidn11-subdirs.patch')
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C') # Simon Josefsson <simon@josefsson.org>
sha256sums=('SKIP'
            '0c440fe12da1372e8f9388e6b2bed3f0dd57d2696e08cb8d92e9880fd315ca63')

prepare() {
  cd libidn

  patch -Np1 -i ../libidn11-subdirs.patch
  make -f GNUmakefile autoreconf
}

build() {
  cd libidn

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-nls \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libidn install
  rm -rf "${pkgdir}"/usr/{include,lib32/{libidn.so,pkgconfig}}
}

# vim: ts=2 sw=2 et:
