# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
pkgname=python-pylink-square
pkgver=1.2.0
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(
  python
  python-future
  python-psutil
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-0.14.3-remove_mock.patch
)
sha512sums=('eb9164e7bf409a595f17edfc5352f4d361e96cf4f315d42874401918e3ec869fc5a63cf38c9f7fde1448dc967d8aec4e2f0ac1eeb05f276e4def4bbbf7ab821b'
            '35ff6497171de4acb6eebbca0619419ba8fa74da9487181dcbd90068fe2c7122e79d0d3e54dfc9a0bf010e398d144ff6ce20ca5e76e426269f6274b1d66287da')
b2sums=('4e0d8deb63f4d927eda7578cb6f23f44225d3bacb419768353b2966dca30a48a258ea1acd268392b4dc3a49047827e81de5321d6fb6027b9517cf4855d644d9b'
        '4cc08b683975b3400caa0d73efb986737971c1003f1c0632d7440c25c9f0cc661f847275753c6ba03dc214e303a3cfd1ea8d3fb2bb6824c7560945fe1f2ecb05')

prepare() {
  # remove use of mock: https://github.com/square/pylink/issues/149
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.14.3-remove_mock.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
