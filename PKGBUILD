# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
_pkgname=vdirsyncer
pkgver=0.16.0
pkgrel=1
pkgdesc="Synchronize CalDAV and CardDAV."
arch=('any')
url="https://vdirsyncer.readthedocs.org/"
license=('BSD')
replaces=('python2-vdirsyncer')
provides=('python2-vdirsyncer')
depends=('python-click' 'python-setuptools'
         'python-requests-toolbelt' 'python-atomicwrites'
         'python-click-threading' 'python-click-log')
makedepends=('python-setuptools-scm')
optdepends=('python-requests-oauthlib: Google support')
checkdepends=('python-pytest' 'python-wsgi-intercept'
              'radicale' 'python-pytest-xprocess' 'python-pytest-localserver'
              'python-hypothesis' 'python-pytest-subtesthack')
source=("https://pypi.io/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://github.com/pimutils/vdirsyncer/blob/$pkgver/contrib/vdirsyncer.service"
        "https://github.com/pimutils/vdirsyncer/blob/$pkgver/contrib/vdirsyncer.timer")
md5sums=('cf6754758de5cdfc33d184e91318f94d'
         '82d3edefa6a310dc969d7807ac42f1d3'
         'd0b5601a6515b44388994d3bbb94a041')

check() {
  cd "$srcdir/${_pkgname}-$pkgver"
  rm "tests/system/utils/test_main.py"
  make test
}

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$srcdir/vdirsyncer.service" "$pkgdir/usr/lib/systemd/user/vdirsyncer.service"
  install -Dm 644 "$srcdir/vdirsyncer.timer" "$pkgdir/usr/lib/systemd/user/vdirsyncer.timer"
}
