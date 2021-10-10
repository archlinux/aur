# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=ruby2.7
pkgver=2.7.4
pkgrel=2
arch=(x86_64)
pkgdesc='An object-oriented language for quick and easy programming, version 2.7'
url='https://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(libxcrypt gdbm openssl libffi libyaml gmp zlib)
optdepends=(
    'tk: for Ruby/TK'
)
makedepends=(tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('2cbb70ecfdd69120e789023ddb2b25cab0d03bc33fdc367a8f74ca8a3ee785c18c8ded9de3ecee627c7e275ffb85147e6abf921b6a61e31851b37c7fedf45bf9')

build() {
  cd ruby-${pkgver}

  ./configure \
    --prefix=/usr \
    --program-suffix=-2.7 \
    --with-soname=ruby-2.7 \
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

package() {
  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby2.7/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby2.7/BSDL"

  # remove files conflicting with 'ruby' package
  rm -r "$pkgdir"/usr/share/man/
}
