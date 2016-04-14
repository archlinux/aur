# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=ruby-stable-snapshot
pkgdesc='An object-oriented language for quick and easy programming (stable snapshot)'
depends=(gdbm openssl libffi libyaml gmp zlib)
optdepends=(
    'ruby-docs: Ruby documentation'
    'tk: for Ruby/TK'
)
provides=(rubygems rake)
conflicts=(rake ruby)
backup=(etc/gemrc)
install=ruby.install
pkgver=2.3.0
pkgrel=1
arch=(i686 x86_64)
url='http://www.ruby-lang.org/en/'
license=(BSD custom)
makedepends=(gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz
        gemrc)

sha1sums=('db9a8aa8bb80eed2b07481f2ab386d4d6ceafa2b'
          'dc536754c8fac2c3d82965c5a708cd8f79562d98')

build() {
  cd stable-snapshot

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/usr \
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
  cd stable-snapshot

  make test
}

package() {

  cd stable-snapshot

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 ${srcdir}/gemrc "${pkgdir}/etc/gemrc"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby/BSDL"
}
