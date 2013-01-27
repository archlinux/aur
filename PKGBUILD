# Contributor: Johannes Dewender  arch at JonyJD dot net
pkgname=debhelper-python2
_pkgname=python-defaults
pkgver=2.7.3
pkgrel=1
_pkgrel=3
pkgdesc="debhelper scripts for Python 2: pyversions, python2.pm"
arch=('any')
url="http://packages.debian.org/sid/python"
license=('custom:MIT')
groups=()
depends=('debhelper' 'python2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver-$_pkgrel.tar.gz)
md5sums=('7fb22d7d50a776f20b77cc96dcc1afab')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
  for file in {dh_python2,pyclean,pycompile,debian/pyversions.py}; do
    sed -i -e '1s|/usr/bin/python$|/usr/bin/python2|' $file
  done
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check_versions
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/local/bin $pkgdir/usr/bin
  mv $pkgdir/usr/local/share $pkgdir/usr/share
  mkdir -p $pkgdir/usr/share/perl5/vendor_perl
  mv $pkgdir/usr/share/perl5/Debian $pkgdir/usr/share/perl5/vendor_perl/Debian
  rm -r $pkgdir/usr/local

  mkdir -p $pkgdir/usr/share/python
  install -m 755 debian/pyversions.py $pkgdir/usr/share/python/
  ln -s -r $pkgdir/usr/share/python/pyversions.py $pkgdir/usr/bin/pyversions 
  install -m 755 debian/debian_defaults $pkgdir/usr/share/python/
  gzip -f debian/pyversions.1
  mkdir -p $pkgdir/usr/share/man/man1
  install -m 644 debian/pyversions.1.gz $pkgdir/usr/share/man/man1/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -D -m 644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

