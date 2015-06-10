# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Caleb McCombs <erdrick016+aur@gmail.com>
# Contributor: Christian Hesse <arch@eworm.de>

pkgname=neko
pkgver=2.0.0
pkgrel=6
pkgdesc='High-level language which can also be used as an embedded scripting language'
url='http://nekovm.org/'
license=('LGPL')
arch=('x86_64' 'i686')
depends=('gc' 'gtk2' 'libmariadbclient' 'sqlite' 'apache')
makedepends=('pkgconfig' 'setconf' 'apr')
options=('!strip')
source=("git://github.com/HaxeFoundation/neko.git#tag=v${pkgver/.0.0/-0}"
        'http://ftp.de.debian.org/debian/pool/main/n/neko/neko_2.0.0-3.debian.tar.gz'
        'install.neko.patch')
sha256sums=('SKIP'
            '5cd4b458398c94f740fd8643e2b70c51460653fecfc13ba097708096e0cf5ee8'
            '999e85cb77941c908bd4650f9d7177519fb2b35e50cc24f9d8465506c03d8d4f')

# TODO: See if the hacky/unsual build procedures can be cleaned up a bit.
#       This should be done in cooperation with upstream, if possible.

prepare() {
  cd "$pkgname"
  sed 's|= -Wall -O3|+=|g;s|-mkdir|mkdir -p|g;/strip/d' -i Makefile
  sed -i 's/client_r.a/client_r.so/' src/tools/install.neko
  setconf Makefile MAKESO '$(CC) -shared'
  mkdir -p bin
  patch -p2 -i "$srcdir/install.neko.patch"
  patch -p1 -i "$srcdir/debian/patches/apache2.4.diff"
}

build() {
  cd "$pkgname"
  [ $CARCH = x86_64 ] && export CFLAGS+=" -D_64BITS"
  make clean
  # Attempt to build libneko up to three times if it fails
  for x in 1 2 3; do make libneko && break; done
  make neko std
  make
}

check() {
  make -C "$pkgname" test
}

package() {
  install -d "$pkgdir/usr/"{bin,lib}
  make -C "$pkgname" INSTALL_PREFIX="$pkgdir/usr" install
  find "$pkgdir/usr/lib" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
