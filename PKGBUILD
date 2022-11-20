# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-flaky
pkgver=3.7.0
pkgrel=7
pkgdesc='Plugin for nose or py.test that automatically reruns flaky tests'
arch=('any')
license=('Apache')
url='https://github.com/box/flaky'
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-nose' 'python38-genty')
source=("$pkgname-$pkgver.tar.gz::https://github.com/box/flaky/archive/v$pkgver.tar.gz"
        "update-python-versions.patch::https://github.com/box/flaky/commit/32fd411fc20f4f21e954f06e377d515ae5a233b5.patch")
sha512sums=('20ec44c721aa68aad07b5669a3b23b7551380ef5cddecf9cc6197bbf78c5b1a823887046394aa6c4a66011e1a31c78b02c3cc89e96775498b600f20211ce7b99'
            '5801dd8ff6433efd60fd4716a9110e4ca350bf0415df5180668f2edf12057bae5a0c623b94f2ec1f3fd2c88e8e07538ad5904fe739d4f687927312857bcc0717')

prepare() {
  cd "$srcdir"/flaky-$pkgver
  patch -Np1 -i ${srcdir}/update-python-versions.patch
}

build() {
  cd "$srcdir"/flaky-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd "$srcdir"/flaky-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH"
    nosetests3 --with-flaky --exclude="test_nose_options_example" test/test_nose/
    py.test -k 'example and not options' --doctest-modules test/test_pytest/
    py.test -p no:flaky test/test_pytest/test_flaky_pytest_plugin.py
    nosetests3 --with-flaky --force-flaky --max-runs 2 test/test_nose/test_nose_options_example.py
    py.test --force-flaky --max-runs 2 test/test_pytest/test_pytest_options_example.py
  )
}

package() {
  cd "$srcdir"/flaky-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
