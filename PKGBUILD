# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=ruby2.7
pkgver=2.7.2
pkgrel=1
arch=(x86_64)
url='https://www.ruby-lang.org/en/'
license=(BSD custom)
depends=(libxcrypt)
makedepends=(gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
options=(!emptydirs)
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('7972278b096aa768c7adf2befd26003e18781a29ca317640317d30d93d6e963ded197724c8e2f1dfe1e838c5647176d414a74732a62e931fb50d6f2e0f777349')

build() {
  cd ruby-${pkgver}

  ./configure \
    --prefix=/usr \
    --program-suffix=-2.7 \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sharedstatedir=/var/lib \
    --libexecdir=/usr/lib/ruby \
    --enable-shared \
    --disable-rpath \
    --with-dbm-type=gdbm_compat

  make
}

package() {
  pkgdesc='An object-oriented language for quick and easy programming'
  depends=(gdbm openssl libffi libyaml gmp zlib)
  optdepends=(
      'tk: for Ruby/TK'
  )

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby2.7/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby2.7/BSDL"

  # remove files conflicting with 'ruby' package
  rm -r "$pkgdir"/usr/share/man/
  rm "$pkgdir"/usr/lib/libruby.so
}
