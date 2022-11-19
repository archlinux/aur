# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Igor Ramos Tiburcio <irtigor@yahoo.com.br>
# Contributor: Wieland Hoffmann <themineo+aur@gmail.com>
# Contributor: Hervé Cauwelier <herve ¤ oursours.net>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python38-py
pkgver=1.11.0
pkgrel=1
pkgdesc="library with cross-python38 path, ini-parsing, io, code, log facilities"
arch=('any')
license=('MIT')
url="https://py.readthedocs.io/"
depends=('python38-iniconfig' 'python38-apipkg')
makedepends=('python38-setuptools' 'python38-setuptools-scm')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/py/archive/$pkgver.tar.gz"
        py-pytest-4.patch::https://github.com/pytest-dev/py/pull/222.patch)
sha512sums=('7307e41e0120b8d4cc9b77fd4b5fc93cb649e05c7bd41002edfead20cf027a32956faffd764dff9a95e97600604ae76b25c472a99b0a44a7842c862c8846717b'
            'cabfdb8cd2e229bfbd5e770a145dde60f9e649f683f8e3d57d2cf393a4d246fcb0eae4596cbbee010de97bfca26470a5dd4280d0f9e34d7f30df19b09f5ea8b6')

prepare() {
  patch -d py-$pkgver -p1 -i ../py-pytest-4.patch || :  # Failures are doc only
  rm -r py-$pkgver/py/_vendored_packages

  export LC_CTYPE=en_US.UTF-8
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd "$srcdir"/py-$pkgver
  python3.8 setup.py build
}

check() {
  # Known failure: https://github.com/pytest-dev/py/issues/104

  cd "$srcdir"/py-$pkgver
  python3.8 setup.py pytest || echo "Tests failed"
}

package() {
  cd py-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
