# Contributor: Johannes Dewender  arch at JonyJD dot net
# Contributor: C. Dominik Bódi  dominik.bodi at gmx dot de

pkgname=debhelper-python
pkgver=3.7.3
pkgrel=1

_debpy_name=python3-defaults
_debpy_ver=$pkgver
_debpy_rel=1

_py3def_name=dh-python
_py3def_ver=3.20180927

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
sha512sums=('b3a74dc8554c14095dfd7ccd312c5ca7012466d18f64a7ece4733c2c5b61922b051906845fec322740d46907d57f072baa0200c8cdcc222ba52164840941e9da'
            '40611fb6908dc634eda53a5c5cf54e67f81b8acd89d94148f9b9b02730c97f08b4386e54e6c0a4bc2b81cb8e46b7926ee1dd8e34f654dcd2c1f05cf753eaee18'
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
