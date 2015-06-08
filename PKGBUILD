# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=ruby2.0
pkgver=2.0.0_p645
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='An object-oriented language for quick and easy programming'
url='http://www.ruby-lang.org/en/'
license=('BSD' 'custom')
depends=('gdbm' 'openssl' 'libffi' 'libyaml')
optdepends=('tk: for Ruby/TK')
makedepends=('gdbm' 'openssl' 'tk' 'libffi' 'doxygen' 'graphviz' 'libyaml')
provides=('rubygems2.0' 'rake2.0')
options=('!emptydirs' '!makeflags' 'staticlibs')
source=("http://cache.ruby-lang.org/pub/ruby/${pkgver%.*}/ruby-${pkgver//_/-}.tar.bz2")

build() {
  cd ruby-${pkgver//_/-}

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/opt/$pkgname \
    --sysconfdir=/etc \
    --enable-shared \
    --disable-rpath \
    --with-dbm-type=gdbm_compat \
    --program-suffix=-2.0

  make ruby
}

check() {
  cd ruby-${pkgver//_/-}

  make test
}

package() {
  cd ruby-${pkgver//_/-}

  make DESTDIR="${pkgdir}" install-nodoc

  install -dm755 $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/lib

  for i in erb irb rdoc ri ruby testrb rake gem; do
    ln -s /opt/$pkgname/bin/$i-2.0 $pkgdir/usr/bin/$i-2.0
    ln -s /opt/$pkgname/bin/$i-2.0 $pkgdir/opt/$pkgname/bin/$i
  done

  ln -s /opt/$pkgname/lib/libruby.so.2.0 $pkgdir/usr/lib/libruby.so.2.0

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname/BSDL"
}

sha256sums=('2dcdcf9900cb923a16d3662d067bc8c801997ac3e4a774775e387e883b3683e9')
