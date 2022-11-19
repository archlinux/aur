# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>

pkgname=python38-tox
pkgver=3.26.0
pkgrel=2
pkgdesc='Python 3.8 virtualenv management and testing tool'
arch=('any')
url='https://tox.readthedocs.io'
license=('GPL2')
depends=('python38-py' 'python38-virtualenv' 'python38-packaging' 'python38-pluggy' 'python38-tomli' 'python38-filelock' 'python38-six')
makedepends=('python38-setuptools-scm' 'python38-py' 'python38-virtualenv'
             'python38-pluggy' 'python38-toml'
             'python38-filelock' 'python38-freezegun')
checkdepends=('python38-pytest-runner' 'python38-pytest-mock'
              'python38-flaky')
source=("https://pypi.io/packages/source/t/tox/tox-$pkgver.tar.gz")
sha512sums=('36a4a8deb5d2a9f36be9ddf75ce7422f9792911348b68a71acc9ae48a1159ef671e7ceaa1c86ef3e610c0c69f21f5a6e668ba2676ee811a427d04ebfab06111b')

prepare() {
  find tox-$pkgver -name "*.pyc" -delete
}

build() {
  export LC_CTYPE=en_US.UTF-8

  cd "$srcdir"/tox-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points

  (
    cd "$srcdir"/tox-$pkgver
    virtualenv "$srcdir/pyvenv" --system-site-packages
    . "$srcdir/pyvenv/bin/activate"
    python3.8 setup.py install
    python3.8 setup.py pytest
  )
}

package() {
  cd "$srcdir"/tox-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  ln -s tox "$pkgdir"/usr/bin/tox3
}
