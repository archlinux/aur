# Contributor: Johannes Dewender  arch at JonyJD dot net
pkgname=debhelper-python2
_pkgname=python-defaults
pkgver=2.7.5
pkgrel=3
_pkgrel=5
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
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver-$_pkgrel.tar.gz makefile_supported.patch)
md5sums=('066c3b10e9f1ede9187eea6fd1f851d5'
         'ba61b80b7461b85283b6695e1bf6a768')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  for file in {dh_python2,pyclean,pycompile,debian/pyversions.py}; do
    sed -i -e '1s|/usr/bin/python$|/usr/bin/python2|' $file
  done
  sed -i -e 's|>/dev/stderr|>\&2|g' Makefile
  patch -p1 < ../makefile_supported.patch
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
  # remove tools that are installed with debhelper-python (Python 3)
  rm $pkgdir/usr/share/debhelper/autoscripts/{postinst-pycompile,prerm-pyclean}

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

