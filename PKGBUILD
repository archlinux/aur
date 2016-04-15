# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=('ruby2.1')
pkgver=2.1.10
pkgdesc='An object-oriented language for quick and easy programming'
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.ruby-lang.org/en/'
license=('BSD' 'custom')
depends=('gdbm' 'openssl' 'libffi' 'libyaml' 'gmp' 'zlib')
makedepends=('gdbm' 'openssl' 'libffi' 'doxygen' 'graphviz' 'libyaml' 'ttf-dejavu' 'tk')
optdepends=('tk: for Ruby/TK')
options=('!emptydirs' 'staticlibs')
source=("https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz")

build() {
  cd ruby-${pkgver}

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/opt/ruby2.1 \
    --program-suffix=-2.1 \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sharedstatedir=/var/lib \
    --libexecdir=/usr/lib/ruby \
    --enable-shared \
    --disable-rpath \
    --with-dbm-type=gdbm_compat

  make ruby
}

check() {
  cd ruby-${pkgver}

  make test
}

package() {
  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -dm755 $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/lib

  for i in erb irb rdoc ri ruby testrb rake gem; do
    ln -s /opt/$pkgname/bin/$i-2.1 $pkgdir/usr/bin/$i-2.1
    ln -s /opt/$pkgname/bin/$i-2.1 $pkgdir/opt/$pkgname/bin/$i
  done

  ln -s /opt/$pkgname/lib/libruby.so.2.1 $pkgdir/usr/lib/libruby.so.2.1

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname/BSDL"
}
sha256sums=('5be9f8d5d29d252cd7f969ab7550e31bbb001feb4a83532301c0dd3b5006e148')
