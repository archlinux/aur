# Maintainer: xunhua.guo <xunhua.guo@gmail.com>
# Contributor: Ben <ben@ported.pw>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=cups-bjnp
pkgver=2.0.3
pkgrel=3
pkgdesc='CUPS back-end for the canon printers using the proprietary USB over IP BJNP protocol'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/cups-bjnp/'
license=('GPL')
depends=('libcups')
makedepends=('cups')
source=("http://downloads.sourceforge.net/sourceforge/cups-bjnp/cups-bjnp-${pkgver}.tar.gz")
sha256sums=('c914b2fd9d8e26ce22f2df6244d9defeec31ee9a5360f723eecb3b00f2168500')
# Disable LTO to suppress some compilation errors.
options=("!lto")

build() {
  cd cups-bjnp-${pkgver}

  # Patch for https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/Warning-Options.html#index-Wstringop_002dtruncation
  # sed -i 's/strncpy/memcpy/' bjnp-commands.c

  # Remove always-true comparison '(printer_id != NULL)'
  sed -i '188d;191d' bjnp-commands.c

  ./configure --prefix='/usr'
  make
}

package() {
  cd cups-bjnp-${pkgver}

  make DESTDIR="${pkgdir}" install
}

