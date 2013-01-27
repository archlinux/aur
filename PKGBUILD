# Contributor: Johannes Dewender  arch at JonyJD dot net
pkgname=debhelper-python
_pkgname=python3-defaults
pkgver=3.2.3
pkgrel=1
_pkgrel=6
pkgdesc="debhelper scripts for Python 3: pyversions, python3.pm"
arch=('any')
url="http://packages.debian.org/sid/python3"
license=('custom:MIT')
groups=()
depends=('debhelper' 'python')
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
md5sums=('f9fca037e3defc4340bcd90aa38d3afb')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
  # python3 works fine as binary
  #for file in {dh_python3,py3clean,py3compile,debian/py3versions.py}; do
  #  sed -i -e '1s|/usr/bin/python3$|/usr/bin/python|' $file
  #done
  sed -i -e 's|python3.2$|python3.3|g' debian/debian_defaults
  sed -i -e 's|python3.1$|python3.2|g' debian/debian_defaults
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  #make -k check_versions
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/local/bin $pkgdir/usr/bin
  mv $pkgdir/usr/local/share $pkgdir/usr/share
  mkdir -p $pkgdir/usr/share/perl5/vendor_perl
  mv $pkgdir/usr/share/perl5/Debian $pkgdir/usr/share/perl5/vendor_perl/Debian
  rm -r $pkgdir/usr/local

  mkdir -p $pkgdir/usr/share/python3
  install -m 755 debian/py3versions.py $pkgdir/usr/share/python3/
  ln -s -r $pkgdir/usr/share/python/py3versions.py $pkgdir/usr/bin/py3versions 
  install -m 755 debian/debian_defaults $pkgdir/usr/share/python3/
  gzip -f debian/py3versions.1
  mkdir -p $pkgdir/usr/share/man/man1
  install -m 644 debian/py3versions.1.gz $pkgdir/usr/share/man/man1/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -D -m 644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

