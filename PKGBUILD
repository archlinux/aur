# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=7.0.3
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='https://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-geoip2' 'python-requests' 'python-dnspython' 'python-sqlalchemy')
makedepends=('python-sphinx' 'python-sphinxcontrib-autoprogram')
checkdepends=('python-pytest-runner')
backup=('etc/sopel.cfg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sopel-irc/sopel/archive/v$pkgver.tar.gz"
        sopel-ddg-test-fix.patch::https://github.com/sopel-irc/sopel/commit/a687ab706f47a487bf489f6bb32d773033f64f7b.patch)
sha512sums=('ba49dc8045e0a7bc414503b4252ebb129c27f0f4a2d01997a5d770a048518fb21b9cf3ab00cba7a11ce04a59c837fe3c3a1413dff3071ef6705b5cf45456d153'
            'e6071860acaf31bd0a38390a5e38e76fa8ec144d45e9cf15bb80508a4bd4467eb25dbcbe2036f9e8ce6d14f4d6adce0b89e8e9ea558601f0f47a6c936ac4bbd1')

prepare() {
  cd sopel-$pkgver
  patch -p1 -i ../sopel-ddg-test-fix.patch
  sed -i -e 's/<3/<4/' -e 's/<6/<8/' {dev-,}requirements.txt
}

build() {
  cd sopel-$pkgver
  python setup.py build egg_info
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd sopel-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py pytest --addopts "--ignore build/"
}

package() {
  cd sopel-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/sopel.cfg "$pkgdir/etc/sopel.cfg"
  install -Dm644 contrib/sopel.service "$pkgdir/usr/lib/systemd/system/sopel.service"
  install -Dm644 contrib/sopel.conf "$pkgdir/usr/lib/tmpfiles.d/sopel.conf"
  install -Dm644 docs/build/man/sopel.1 "$pkgdir/usr/share/man/man1/sopel.1"
}
