# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=('ruby-2.1' 'ruby-docs-2.1')
pkgver=2.1.5
pkgrel=6
arch=('i686' 'x86_64')
url='http://www.ruby-lang.org/en/'
license=('BSD' 'custom')
# disable ruby tk since 1.9.3 it has caused a segfault on require 'tk'
# https://bugs.ruby-lang.org/issues/8000
# wait for upstream to start supporting tk 8.6
makedepends=('gdbm' 'openssl' 'libffi' 'doxygen' 'graphviz' 'libyaml' 'ttf-dejavu') # 'tk'
options=('!emptydirs' '!makeflags' 'staticlibs')
source=("http://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz"
        'gemrc'
        'disable_sse2_on_i686.patch')
sha1sums=('52f8bafb4349eaf32fb99ba3d71e46fd924af966'
          'de4b760b7e2cd9af88ca67536ce37b950f1ee514'
          '6e919c4892ef1f02d99e5620c6aac1251fc4597c')


prepare() {
  cd ruby-${pkgver}

  # FS#39470
  patch -Np1 -i ${srcdir}/disable_sse2_on_i686.patch
}

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
    --disable-install-doc

  make
}

check() {
  cd ruby-${pkgver}

  make test
}

package_ruby-2.1() {
  pkgdesc='An object-oriented language for quick and easy programming - version 2.1'
  depends=('gdbm' 'openssl' 'libffi' 'libyaml' 'gmp' 'zlib')
  optdepends=('ruby-docs-2.1: Ruby documentation') # 'tk: for Ruby/TK'
  provides=('rubygems' 'rake', 'ruby=2.0', 'ruby=2.1')
  conflicts=('rake', 'ruby')
  backup=('etc/gemrc')
  install='ruby.install'

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 ${srcdir}/gemrc "${pkgdir}/etc/gemrc"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby/BSDL"
}

package_ruby-docs-2.1() {
  pkgdesc='Documentation files for ruby'
  provides=('ruby-docs')
  conflicts=('ruby-docs')

  cd ruby-${pkgver}

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby-docs/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby-docs/BSDL"
}
