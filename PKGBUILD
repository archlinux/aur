# Maintainer: Jonne Haß <me@jhass.eu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sergey Shatunov <me@prok.pw>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

_rubyver=2.4
pkgname=ruby2.4
pkgver=${_rubyver}.8
pkgdesc='An object-oriented language for quick and easy programming'
pkgrel=1
arch=(x86_64)
url='http://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(gdbm openssl libffi libyaml gmp zlib)
optdepends=('tk: for Ruby/TK')
makedepends=(doxygen graphviz ttf-dejavu tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz https://github.com/ruby/ruby/commit/6c721bd44f0d6818c2df361485ebdc49c75ca913.diff)
sha512sums=('5f51a8312c23c1c2bfbb9c59efbd789492a4a7e4b1d4e7764db6eaaa542008e814b40817f10825e22c7fa8715fb9187be5d09b06128da211559b3601785937ea'
            'bad495dab70ab33f46d33324d57227c6f02cb9c581cbbdcbddcab2c84439e52e7ee9606214c998f6462293ef9e7b7f5ca241c5efa384aace2619fcc61a771e6d')

prepare() {
  cd ruby-${pkgver}
  patch -p1 < ../6c721bd44f0d6818c2df361485ebdc49c75ca913.diff
}

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
