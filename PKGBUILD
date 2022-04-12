# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=ruby2.7
pkgver=2.7.6
pkgrel=1
arch=(x86_64)
pkgdesc='An object-oriented language for quick and easy programming, version 2.7'
url='https://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(libxcrypt gdbm openssl libffi libyaml gmp zlib)
optdepends=(
    'tk: for Ruby/TK'
)
makedepends=(tk)
options=(!emptydirs !lto) # Disable LTO until fixes for https://bugs.ruby-lang.org/issues/18062 released
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('e86410b59d5917786fe43b00fd75dedd0e7f84611286b9274c542d2e562088fcee6bcc6c2596c30ccf793280d2bac6bfbb2619ef0513b3ca31f10f88684c7b1f')

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
