# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Håvard Espeland <espeland@acm.org>
pkgname=libpfm4
pkgver=4.4.0
conflicts=('libpfm3')
pkgrel=2
pkgdesc="The hardware-based performance monitoring interface for Linux."
arch=('x86_64' 'i686')
url="http://perfmon2.sourceforge.net/"
license=('MIT')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-$pkgver.tar.gz"
        'config.mk')
md5sums=('93b853c97a41044ef33c3071bdedb249'
         'd648df674716271b0ce59a857e535e6e')

build() {
  cd "$srcdir/libpfm-$pkgver"
  cp "${srcdir}/config.mk" .
  make
}

check () {
  cd "$srcdir/libpfm-$pkgver/tests"
  ./validate
}

package() {
  cd "$srcdir/libpfm-$pkgver"

  # Install libraries
  make DESTDIR="$pkgdir/" install

  # Install useful example files
  # Note: this match will probably be applied for the next version
  sed -i 's/$(DOCDIR)/$(DESTDIR)$(DOCDIR)/g' perf_examples/Makefile
  make DESTDIR="$pkgdir/" install_examples

  # Install license
  install -D -m0644 COPYING "${pkgdir}"/usr/share/licenses/libpfm4/LICENSE
}

# vim:set ts=2 sw=2 et:
