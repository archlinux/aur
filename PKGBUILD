# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=(ruby ruby-docs)
pkgver=2.2.2
pkgrel=1
arch=(i686 x86_64)
url='http://www.ruby-lang.org/en/'
license=(BSD custom)
makedepends=(jemalloc hardening-wrapper gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
options=(!emptydirs)
source=(http://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz
        gemrc)
sha256sums=('f033b5d08ab57083e48c1d81bcd7399967578c370b664da90e12a32891424462'
            'd36fbabb1cdd492dd4bf04d8db5a313f52e3b61ad0422c830950f83a972a53f4')

build() {
  cd ruby-${pkgver}

  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sharedstatedir=/var/lib \
    --libexecdir=/usr/lib/ruby \
    --enable-shared \
    --disable-rpath \
    --with-dbm-type=gdbm_compat \
    --with-jemalloc

  make
}

check() {
  cd ruby-${pkgver}

  make test
}

package_ruby() {
  pkgdesc='An object-oriented language for quick and easy programming'
  depends=(gdbm openssl libffi libyaml gmp zlib jemalloc)
  optdepends=(
      'ruby-docs: Ruby documentation'
      'tk: for Ruby/TK'
  )
  provides=(rubygems rake)
  conflicts=(rake)
  backup=(etc/gemrc)
  install=ruby.install

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 ${srcdir}/gemrc "${pkgdir}/etc/gemrc"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby/BSDL"
}

package_ruby-docs() {
  pkgdesc='Documentation files for ruby'

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-doc install-capi

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby-docs/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby-docs/BSDL"
}
