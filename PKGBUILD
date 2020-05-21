# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

_rubyver=2.5
pkgbase=ruby2.5
pkgname=(ruby2.5 ruby2.5-docs)
pkgver=2.5.8
pkgrel=2
arch=(x86_64)
url='https://www.ruby-lang.org/en/'
license=(BSD custom)
makedepends=(gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('2886be764a454425c5beef2777c64a70ee0d048b07896b327633d904f5077fea4299526689f9e2ac4dcd2fc4811cf9a6c8ce75367ed35d29dfe1a54222872e0d')

prepare() {
  cd ruby-${pkgver}
  # remove bundled gems, we are going to ship them as separate packages
  rm -rf gems/
}

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

package_ruby2.5() {
  pkgdesc='An object-oriented language for quick and easy programming'
  depends=(gdbm openssl libffi libyaml gmp zlib rubygems ruby-irb)
  optdepends=(
      'ruby-docs: Ruby documentation'
      'tk: for Ruby/TK'
  )
  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname/BSDL"

  rubyver=${pkgver:0:3}.0

  install -dm755 $pkgdir/usr/bin
  install -dm755 $pkgdir/usr/lib

  for i in erb irb rdoc ri ruby testrb rake gem; do
    ln -s /opt/$pkgname/bin/$i-${_rubyver} $pkgdir/usr/bin/$i-${_rubyver}
    ln -s /opt/$pkgname/bin/$i-${_rubyver} $pkgdir/opt/$pkgname/bin/$i
  done

    ln -s /opt/$pkgname/lib/libruby.so.${_rubyver} $pkgdir/usr/lib/libruby.so.${_rubyver}

}

package_ruby2.5-docs() {
  pkgdesc='Documentation files for ruby'

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-doc install-capi

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname-docs/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/$pkgname-docs/BSDL"
}
