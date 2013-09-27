# Contributor: Johannes Dewender  arch at JonyJD dot net
pkgname=debhelper-python
_pkgname=python3-defaults
_pkgname2=dh-python
pkgver=3.3.2
_pkgver=1.20130917
pkgrel=1
_pkgrel=17
pkgdesc="debhelper scripts for Python 3: py3versions, python3.pm"
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
source=(http://ftp.debian.org/debian/pool/main/p/$_pkgname/${_pkgname}_$pkgver-$_pkgrel.tar.gz
http://ftp.debian.org/debian/pool/main/d/$_pkgname2/${_pkgname2}_$_pkgver.orig.tar.xz)
md5sums=('abad7f583e166182e3a7b36b82aaf629'
         '24271694c7096376c7397d6a05fc7ff3')

build() {
  cd "$srcdir/$_pkgname-debian"
  make
  # python3 works fine as binary
  #for file in {dh_python3,py3clean,py3compile,debian/py3versions.py}; do
  #  sed -i -e '1s|/usr/bin/python3$|/usr/bin/python|' $file
  #done

  cd "$srcdir/$_pkgname2-$_pkgver"
  make
}

check() {
  cd "$srcdir/$_pkgname-debian"
  make -k check_versions
}

package() {
  cd "$srcdir/$_pkgname-debian"
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  mkdir -p $pkgdir/usr/share/python3
  install -m 755 debian/py3versions.py $pkgdir/usr/share/python3/
  ln -s -r $pkgdir/usr/share/python3/py3versions.py $pkgdir/usr/bin/py3versions 
  install -m 755 debian/debian_defaults $pkgdir/usr/share/python3/
  gzip -f debian/py3versions.1
  mkdir -p $pkgdir/usr/share/man/man1
  install -m 644 debian/py3versions.1.gz $pkgdir/usr/share/man/man1/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -D -m 644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/

  cd "$srcdir/$_pkgname2-$_pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  mkdir -p $pkgdir/usr/share/perl5/vendor_perl
  mv $pkgdir/usr/share/perl5/Debian $pkgdir/usr/share/perl5/vendor_perl/Debian
}

# vim:set ts=2 sw=2 et:

