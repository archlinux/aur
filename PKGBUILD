# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname='ruby-jemalloc'
pkgdesc='An object-oriented language for quick and easy programming'
pkgver=2.2.2
pkgrel=1
arch=(i686 x86_64)
url='http://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(gdbm openssl libffi libyaml gmp zlib jemalloc)
makedepends=(jemalloc hardening-wrapper gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
optdepends=(
  'ruby-docs: Ruby documentation'
  'tk: for Ruby/TK'
)
provides=(rubygems rake ruby)
conflicts=(rake ruby)
backup=(etc/gemrc)
install=ruby.install
options=(!emptydirs)
source=(http://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz
        gemrc)
sha256sums=('f033b5d08ab57083e48c1d81bcd7399967578c370b664da90e12a32891424462'
            '7afacaadf26274155b35357c9f5c38ead15853a8fb9124039063abaad8544f59')

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

  make showflags main
}

check() {
  cd ruby-${pkgver}

  make test
}

package() {
  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 ${srcdir}/gemrc "${pkgdir}/etc/gemrc"

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby/BSDL"
}
