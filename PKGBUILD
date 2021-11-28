# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

_rubyver=2.6
pkgname=ruby2.6
pkgver=2.6.8
pkgdesc='An object-oriented language for quick and easy programming (version 2.6)'
pkgrel=2
arch=(x86_64)
url='http://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(gdbm openssl libffi libyaml gmp zlib)
optdepends=('tk: for Ruby/TK')
makedepends=(gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('d040ad2238523587d8f356fcb796b8b6ad7f8caff7dd6df09e3f7efcbfa0369e33600e78c7f2bc713ae77c040757cce5c4fec223cb9070209f2bf741899c556d')

build() {
  cd ruby-${pkgver}

  ./configure \
    --prefix=/opt/ruby${_rubyver} \
    --program-suffix=-${_rubyver} \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sharedstatedir=/var/lib \
    --libexecdir=/usr/lib/ruby \
    --enable-shared \
    --disable-rpath \
    --with-dbm-type=gdbm_compat

  make
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
    ln -s /opt/$pkgname/bin/$i-${_rubyver} $pkgdir/usr/bin/$i-${_rubyver}
    ln -s /opt/$pkgname/bin/$i-${_rubyver} $pkgdir/opt/$pkgname/bin/$i
  done

    ln -s /opt/$pkgname/lib/libruby.so.${_rubyver} $pkgdir/usr/lib/libruby.so.${_rubyver}

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname/BSDL"
}
