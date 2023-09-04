# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-cbor
pkgver=1.0.0
pkgrel=10
# The commit that bumps cbor/VERSION.py to 1.0.0
_commit=b3af679e7cf3e12d50acb83c3c591fc5db9a658d
pkgdesc='CBOR rfc7049 for Python'
arch=(x86_64)
url='https://github.com/brianolson/cbor_py'
license=(Apache)
makedepends=(python-setuptools)
depends=(python)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/brianolson/cbor_py/archive/$_commit.tar.gz"
        "$pkgname-issue6.patch::https://github.com/dol-sen/cbor_py/commit/abec52298fd89ed3f4c05ca4c0467c12df740f8d.patch"
        "test_cbor_patch.diff")
sha256sums=('d9211361e37363dfbf54fcb21d23e610aa25679609044844305c2ee5b80b78d9'
            '2f4fcc52fb28790d325355c51a3651ec8c39b85c8e6b415e3ac1394405dd0f2d'
            '2ceabaad4d3ec7a7a283552a325cd5c1b9f343ae7f17e67f4c93bdcbb2afb759')

prepare() {
  cd cbor_py-$_commit
  sed -i 's#logger.warn(#logger.warning(#' cbor/tests/*.py
  # Backport a unmerged fix for tests https://github.com/brianolson/cbor_py/pull/19
  patch -Np1 -i ../$pkgname-issue6.patch
  # Patch for AttributeError: type object 'TestRoot' has no attribute '_ld' on tests
  patch -Np1 -i ../test_cbor_patch.diff
}

build() {
  cd cbor_py-$_commit
  python setup.py build
}

check() {
  cd cbor_py-$_commit
  pyver=$(python -c "import sys; print('{}{}'.format(*sys.version_info[:2]))")
  PYTHONPATH=build/lib.linux-$CARCH-cpython-$pyver pytest
}

package() {
  cd cbor_py-$_commit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
