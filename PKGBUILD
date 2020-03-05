# Contributor: Johannes Dewender  arch at JonyJD dot net
# Contributor: C. Dominik Bódi  dominik.bodi at gmx dot de

pkgname=debhelper-python
pkgver=3.8.2
pkgrel=1

_debpy_name=python3-defaults
_debpy_ver=$pkgver
_debpy_rel=1

_py3def_name=dh-python
_py3def_ver=4.20191017

pkgdesc="debhelper scripts for Python 3: py3versions, python3.pm"
arch=('any')
url="http://packages.debian.org/sid/python3"
license=('custom:MIT')
depends=('python-docutils')
makedepends=('debhelper' 'python')
optdepends=('sgmltools-lite')
provides=('debhelper-python' 'dh-python')
source=(https://deb.debian.org/debian/pool/main/p/${_debpy_name}/${_debpy_name}_${_debpy_ver}-${_debpy_rel}.tar.gz
        https://deb.debian.org/debian/pool/main/d/${_py3def_name}/${_py3def_name}_${_py3def_ver}.tar.xz
        py3versions.patch)
sha512sums=('263f286afea710e2615b273377e6e0a2510b4c8aabd41688c442dcb9689fc7eb67397b916304bdb50c383ef2988dbf54b9ef09a8deb69fda86333d3e1189dc01'
            'efdc456d2066e5f9288251cf6ab2e3b7d63371ed7da6745b1b888e2e847e8f4cbee48ea745af9cbee5307f86c4338f2e89506619e14e7884800589bbef136509'
            '772332cecd85331b6deda25c0d48eed2490e7e7f26d90c7936f46188c706f590771af6edcbb4740a23bff0434ed061bc2b49f8183561cbf4bbb845ed3bebc42a')

prepare() {
  cd "$srcdir/$_debpy_name"
  patch -Np1 < "$srcdir"/py3versions.patch
}

build() {
  cd "$srcdir/$_debpy_name"
  make

  cd "$srcdir/$_py3def_name-$_py3def_ver"
  make
}

check() {
  cd "$srcdir/$_debpy_name"
  sed -i -e 's|/usr/share/python3/debian_defaults|debian/debian_defaults|' \
    debpython/version.py
  make -k check_versions
  sed -i -e 's|debian/debian_defaults|/usr/share/python3/debian_defaults|' \
    debpython/version.py
}

package() {
  cd "$srcdir/$_debpy_name"
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

  cd "$srcdir/$_py3def_name-$_py3def_ver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  # create symlinks to executables in order to make this look like in
  # debian
  ln -s -r $pkgdir/usr/share/dh-python/dh_pypy $pkgdir/usr/bin/dh_pypy
  ln -s -r $pkgdir/usr/share/dh-python/dh_python3 $pkgdir/usr/bin/dh_python3
  ln -s -r $pkgdir/usr/share/dh-python/pybuild $pkgdir/usr/bin/pybuild

  mkdir -p $pkgdir/usr/share/perl5/vendor_perl
  mv $pkgdir/usr/share/perl5/Debian $pkgdir/usr/share/perl5/vendor_perl/Debian

  # python2.pm is in debhelper-python2
  rm $pkgdir/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/python2.pm
}

# vim:set ts=2 sw=2 et:
