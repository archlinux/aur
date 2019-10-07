# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sergey Shatunov <me@prok.pw>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

_rubyver=2.4
pkgname=ruby2.4
pkgver=${_rubyver}.9
pkgdesc='An object-oriented language for quick and easy programming'
pkgrel=1
arch=(x86_64)
url='http://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(gdbm openssl libffi libyaml gmp zlib)
optdepends=('tk: for Ruby/TK')
makedepends=(doxygen graphviz ttf-dejavu tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('9046575315c29c789427c2d00c832f0c0970e47fd158bbe8e4f2df5cff2ea9c06c65c3493adb4656e5b32ebfdc546092911f98a8ad7f698bc001c290db5888c7')

build() {
  cd ruby-${pkgver}

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/opt/ruby${_rubyver} \
    --program-suffix=-${_rubyver} \
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
    ln -s /opt/$pkgname/bin/$i-${_rubyver} $pkgdir/usr/bin/$i-${_rubyver}
    ln -s /opt/$pkgname/bin/$i-${_rubyver} $pkgdir/opt/$pkgname/bin/$i
  done

  ln -s /opt/$pkgname/lib/libruby.so.${_rubyver} $pkgdir/usr/lib/libruby.so.${_rubyver}

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname/BSDL"
}
