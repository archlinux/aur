# Contributor: Johannes Dewender  arch at JonyJD dot net
# Contributor: C. Dominik Bódi  dominik.bodi at gmx dot de

pkgname=debhelper-python
pkgver=3.6.6
pkgrel=1

_debpy_name=python3-defaults
_debpy_ver=$pkgver
_debpy_rel=1

_py3def_name=dh-python
_py3def_ver=3.20180723

pkgdesc="debhelper scripts for Python 3: py3versions, python3.pm"
arch=('any')
url="http://packages.debian.org/sid/python3"
license=('custom:MIT')
depends=('python-docutils')
makedepends=('debhelper' 'python')
optdepends=('sgmltools-lite')
provides=('debhelper-python' 'dh-python')
source=(http://ftp.debian.org/debian/pool/main/p/${_debpy_name}/${_debpy_name}_${_debpy_ver}-${_debpy_rel}.tar.gz
        http://ftp.debian.org/debian/pool/main/d/${_py3def_name}/${_py3def_name}_${_py3def_ver}.tar.xz
        py3versions.patch)
sha512sums=('93ffb0747b6eee882536a1fd03433e5d5ff4508542cfe88fd0cc80e4129e0f70930fe611ed49a7f6da8d266d9d231b057bef2a6a0e64b3666ea95ce1b591bddc'
            'a8ea77aa88c104625ee98fd2ddae9e68f25d973dbbda7435bb81561769f106f89d17b25f090e6ab9c9428c03035016bc75411b6a1344f4dc20f8cc143ca6ccad'
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
