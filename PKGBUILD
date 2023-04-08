# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

_pkgname=django-fake-model
pkgname=python-$_pkgname
pkgver=0.1.4
pkgrel=6
pkgdesc='Simple library for creating fake Django models in the unit tests'
arch=(any)
url='https://github.com/erm0l0v/django-fake-model'
license=(BSD)
makedepends=(python-setuptools)
depends=(python-django)
# Not using PyPI source tarball as it does not include tests
source=("https://github.com/erm0l0v/django-fake-model/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        django2.diff)
sha256sums=('cce30e32dc73a0b6280511cb92079755308a4b79fbfebda48fc55c48230b1d60'
            'ffc0baaacf4a0b507ef99fc0975166cb2a36dde061a2be72e91959157183889d')

prepare() {
  cd $_pkgname-$pkgver
  # Fix compatibility with newer Django
  # 1. on_delete is required for ForeignKey since 2.0 [1]
  # 2. Failure in toggling off foreign_keys are reported since 2.2 [2].
  #    The underlying cause is that django.test.TestCase puts the whole test
  #    in a transaction, and toggling foreign_keys in a transaction is not
  #    supported in SQLite. Use django.test.TransactionTestCase to work
  #    around it.
  # [1] https://github.com/django/django/commit/ddd3268975dca9094d94ab1df56dae0a24a58865
  # [2] https://github.com/django/django/commit/315357ad25a6590e7f4564ec2e56a22132b09001
  patch -Np1 -i ../django2.diff
}

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  python runtests.py tests
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
