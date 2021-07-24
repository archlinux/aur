# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=dh-virtualenv
pkgver=1.2.2
pkgrel=1
pkgdesc="python virtualenvs in Debian packages "
arch=(any)
url="https://github.com/spotify/dh-virtualenv"
license=('GPL2')
groups=()
depends=('python' 'perl')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-docutils')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  "$url/archive/refs/tags/$pkgver.tar.gz"
  "css.patch"
)
sha512sums=('f4b941f2074f5132fe592d9b7403a9e17494842ee4bc0f9fa90c04734c3327136062f770578e26ea6a20ebe2087bad52d1a43e6711d38a2e04e8525602071e6d'
            '74f623840b5b8746874f87cc823bd4fdcc3bc076f51971493bba8b1cbd1a8b9ec02880b53c5e1d8e691f9961333413826e99d2021c3cb768df56419c1b06137f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch --strip=1 < ../css.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build_sphinx
  rst2man doc/dh_virtualenv.1.rst | gzip > doc/dh_virtualenv.1.gz
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
  install -d "$pkgdir/usr/share/perl5/vendor_perl"
  cp -r lib/* "$pkgdir/usr/share/perl5/vendor_perl/"
  install -Dt "$pkgdir/usr/share/debhelper/autoscripts" -m644 autoscripts/*-dh-virtualenv

  install -d "$pkgdir/usr/share/doc"
  cp -r doc/_build/html "$pkgdir/usr/share/doc/$pkgname/"
  install -Dt "$pkgdir/usr/share/man/1" -m644 doc/dh_virtualenv.1.gz
}

# vim:set ts=2 sw=2 et:
